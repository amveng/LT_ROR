# frozen_string_literal: true

class ServersController < ApplicationController
  before_action :authenticate_user!, except: %i[
    index show search
  ]
  before_action :server_belong_user, only: %i[
    edit update destroy publish vip top arhiv generate_token
  ]

  def index
    @server = Server.all.includes(:serverversion)
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
    token = SecureRandom.hex while Server.exists?(token: token) || token.blank?
    if @server.update(token: token)
      redirect_to vote_button_profiles_path, info: 'Ключ доступа изменён'
    else
      redirect_to servers_profiles_path, danger: 'Ошибка при изменении ключа доступа'
    end
  end

  def vip
    if current_user.profile.ltc >= 20
      ltc_update(-20, @server.title, 'Покупка премиум на сервер')
      @server.update(status: 2, status_expires: (Date.today + 30.days), publish: 'published')
      redirect_to servers_profiles_path, success: 'Премиум активирован'
    else
      redirect_to servers_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def top
    if current_user.profile.ltc >= 50
      ltc_update(-50, @server.title, 'Покупка премиум ТОП на сервер')
      @server.update(status: 1, status_expires: (Date.today + 30.days), publish: 'published')
      redirect_to servers_profiles_path, success: 'Премиум ТОП активирован'
    else
      redirect_to servers_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def search
    #--------bad code
    
    @server = Server.all
    if params[:serverversion].present?
      @server = @server.includes(:serverversion).where(serverversions: { name: params[:serverversion] })
    end
    @server = @server.where(rate: params[:rate]) if params[:rate].present?
    @server = @server.where(datestart: params[:datestart_begin].to_date..params[:datestart_end].to_date)

    #---------------------------------------------

    # @server = Server.includes(:serverversion).where(
    #   rate: search_params[:rate],
    #   datestart: search_params[:datestart_begin].to_date..search_params[:datestart_end].to_date,
    #   serverversions: { name: search_params[:serverversion] }
    # )

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
      ServerCreateMailer.server_created(@server).deliver_later
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

  def ltc_update(ltc, prod, info)
    current_user.profile.update(
      ltc: current_user.profile.ltc + ltc,
      last_product: prod,
      last_description: info
    )
  end

  def server_view
    viewer = if current_user.blank?
               request.remote_ip.to_s
             else
               current_user.id
             end

    ServerView.where(date: Date.today, server_id: @server.id, viewer: viewer).first_or_create
  end

  def server_belong_user
    set_server
    acces_close unless @server.user_id == current_user.id
  end

  def set_server
    @server = Server.find(params[:id])
  end

  def acces_close
    # TODO: надо сделать какой то счетчик перед тем как банить
    # current_user.update_attributes(baned: true)
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end

  def search_params
    params.permit %i[rate serverversion datestart_begin datestart_end]
  end

  def server_params
    params.require(:server).permit(
      :title, :rate, :description, :urlserver,
      :imageserver, :datestart, :serverversion_id
    )
  end
end
