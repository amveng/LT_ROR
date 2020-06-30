# frozen_string_literal: true

class ServersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
  before_action :set_server, only: %i[show edit update destroy]

  def index
    @server = Server.all.includes(:serverversion)
    # @server = Server.where(rate: params[:rate])
  end

  def show; end

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
  end

  def create
    @server = Server.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to servers_profiles_path, success: 'Сервер успешно создан'
    else
      flash.now[:danger] = 'Сервер не создан'
      render :new
    end
  end

  def edit
    acces_close unless server_belong_user?
  end

  def update
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

  def server_belong_user?
    @server.user_id == current_user.id
  end

  def set_server
    @server = Server.find(params[:id])
  end

  def acces_close
    current_user.update_attributes(baned: true)
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end

  def server_params
    params.require(:server).permit(:title, :rate, :description, :urlserver, :imageserver, :datestart, :serverversion_id)
  end
end
