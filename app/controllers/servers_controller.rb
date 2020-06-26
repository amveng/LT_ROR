# frozen_string_literal: true

class ServersController < ApplicationController
  # layout false
  # before_action :set_version
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_server, only: %i[show edit update destroy]
  # before_action :check_new_server, only: %i[new]
  def index  
    @server = Server.all.includes(:serverversion)
    # .includes(:serverversion)
  end

  def show; end

  def new
    @server = Server.new
  end

  def create
    @server = Server.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to servers_path, success: 'Сервер успешно создан'
    else
      # flash.now[:danger] = 'Сервер не создан'
      render :new
    end
  end

  def edit
    acces_close unless @server.user_id == current_user.id
  end

  def update
    # @server.user_id = current_user.id
    if @server.update_attributes(server_params)
      redirect_to @server, success: 'Сервер успешно изменён'
    else
      # flash.now[:danger] = 'Сервер не изменён'
      render :edit
    end
  end

  def destroy
    if @server.user_id == current_user.id
      @server.destroy
      redirect_to @server, info: 'Сервер успешно удален'
    else
      acces_close
    end
  end

  private

  # def check_new_server
  #   acces_close if @servers_user.pluck('publish').include? false
  # end

  # def set_version
  #   @versions = Serverversion.pluck 'hronicle'
  # end

  def set_server
    @server = Server.find(params[:id])
    # acces_close unless @server.user_id == current_user.id
  end

  def acces_close
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end

  def server_params
    params.require(:server).permit(:title, :rate, :urlserver, :datestart, :serverversion_id)
  end
end
