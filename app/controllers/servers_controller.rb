# frozen_string_literal: true

class ServersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
  before_action :set_server, only: %i[show edit update destroy publish vip top]

  def index
    @server = Server.all.includes(:serverversion)
    @servers_expires = Server.where(status_expires: ..Date.today, status: 1..2)
    if @servers_expires.present?
      servers_update_status
    end
    # @server = Server.where(rate: params[:rate])
  end

  def show; end

  def publish
    if server_belong_user?
      if @server.update_attributes(publish: 'unverified')
        redirect_to servers_profiles_path, info: 'Заявка на публикацию принята в обработку'
      else
        redirect_to servers_profiles_path, danger: 'Ошибка при запросе публикации'
      end
    else
      acces_close
    end
  end

  def vip
    if server_belong_user?
      if current_user.profile.ltc >= 20
        current_user.profile.update_attributes(ltc: (current_user.profile.ltc - 20))
        @server.update_attributes(status: 2, status_expires: (Date.today + 30.days))
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
    else
      acces_close
    end
  end

  def top
    if server_belong_user?
      if current_user.profile.ltc >= 50
        current_user.profile.update_attributes(ltc: (current_user.profile.ltc - 50))
        @server.update_attributes(status: 1, status_expires: (Date.today + 30.days))
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
    else
      acces_close
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
       Проверьте данные м нажмите кнопу опубликовать'
    else
      flash.now[:danger] = 'Сервер не создан'
      render :new
    end
  end

  def edit
    acces_close unless server_belong_user?
  end

  def update
    @server.publish = 'unverified'
    if @server.update_attributes(server_params)
      redirect_to servers_profiles_path, success: 'Сервер успешно изменён'
    else
      flash.now[:danger] = 'Сервер не изменён'
      render :edit
    end
  end

  def destroy
    if server_belong_user?
      @server.destroy
      redirect_to servers_profiles_path, info: 'Сервер успешно удален'
    else
      acces_close
    end
  end

  private

  def servers_update_status
    @servers_expires.each do |f|
      f.update(status: 3)
    end
  end

  def server_belong_user?
    @server.user_id == current_user.id
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
