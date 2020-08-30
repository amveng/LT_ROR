# frozen_string_literal: true

class ServersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
  before_action :server_belong_user, only: %i[edit update destroy publish vip top arhiv generate_token]

  def index
    @server = Server.all.includes(:serverversion)
    @servers_expires = Server.where(status_expires: ..Date.yesterday, status: 1..2)
    servers_update_status if @servers_expires.present?
  end

  def show
    set_server
    server_view
  end

  def arhiv
    @server.update(publish: 'arhiv')
    redirect_to servers_profiles_path, info: 'Статус публикации изменен на архивный'
  end

  def publish
    if @server.update(publish: 'unverified')
      redirect_to servers_profiles_path, info: 'Заявка на публикацию принята в обработку'
    else
      redirect_to servers_profiles_path, danger: 'Ошибка при запросе публикации'
    end
  end

  def generate_token
    token = SecureRandom.hex while Server.exists?({ token: token })
    if @server.update(token: token)
      redirect_to vote_button_profiles_path, info: 'Ключ доступа изменён'
    else
      redirect_to servers_profiles_path, danger: 'Ошибка при изменении ключа доступа'
    end
  end

  def vip
    if current_user.profile.ltc >= 20
      current_user.profile.update(ltc: (current_user.profile.ltc - 20))
      @server.update(status: 2, status_expires: (Date.today + 30.days), publish: 'published')
      LtcBilling.create(
        user_id: current_user.id,
        amount: -20,
        description: 'Покупка премиум на сервер',
        product_name: @server.title
      )
      redirect_to servers_profiles_path, success: 'Премиум активирован'
    else
      redirect_to servers_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def top
    if current_user.profile.ltc >= 50
      current_user.profile.update(ltc: (current_user.profile.ltc - 50))
      @server.update(status: 1, status_expires: (Date.today + 30.days), publish: 'published')
      LtcBilling.create(
        user_id: current_user.id,
        amount: -50,
        description: 'Покупка премиум ТОП на сервер',
        product_name: @server.title
      )
      redirect_to servers_profiles_path, success: 'Премиум ТОП активирован'
    else
      redirect_to servers_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def search
    @server = Server.all
    if params[:serverversion] != 'Хроники'
      @server = @server.includes(:serverversion).where(
        serverversions: { name: params[:serverversion] }
      )
    end
    @server = @server.where(rate: params[:rate]) if params[:rate] != 'Рейты'
    @server = @server.today if params[:datestart] == 'today'
    @server = @server.tomorrow if params[:datestart] == 'tomorrow'
    @server = @server.yesterday if params[:datestart] == 'yesterday'
    render :index
  end

  def new
    @server = Server.new
    @server.datestart = Date.today + 7.day
  end

  def create
    @server = Server.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to servers_profiles_path, success: 'Сервер успешно создан.
       Проверьте данные и нажмите кнопку опубликовать'
    else
      flash.now[:danger] = 'Сервер не создан'
      render :new
    end
  end

  def edit; end

  def update
    if @server.status == 3 || @server.publish == 'failed'
      @server.publish = 'unverified'
      @server.failed = ''
    end
    if @server.update(server_params)
      redirect_to servers_profiles_path, success: 'Сервер успешно изменён'
    else
      flash.now[:danger] = 'Сервер не изменён'
      render :edit
    end
  end

  def destroy
    @server.destroy
    redirect_to servers_profiles_path, info: 'Сервер успешно удален'
  end

  private

  def server_view
    viewer = if current_user.blank?
               request.remote_ip.to_s
             else
               current_user.id
             end

    ServerView.where(date: Date.today, server_id: @server.id, viewer: viewer).first_or_create
  end

  def servers_update_status
    @servers_expires.each do |f|
      f.update(status: 3)
    end
  end

  def server_belong_user
    set_server
    acces_close unless @server.user_id == current_user.id
  end

  def set_server
    @server = Server.find(params[:id])
  end

  def acces_close
    # current_user.update_attributes(baned: true)
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end

  def server_params
    params.require(:server).permit(:title, :rate, :description, :urlserver, :imageserver, :datestart, :serverversion_id)
  end
end
