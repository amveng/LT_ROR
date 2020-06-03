# frozen_string_literal: true

class ListserversController < ApplicationController
  before_action :set_version
  # before_action :authenticate_user!, except: %i[index]
  before_action :set_server, only: %i[show edit update destroy]
  def index
    @listservers = Listserver.all
  end

  def show; end

  def new
    @server = Listserver.new
  end

  def create
    @server = Listserver.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to listservers_path, success: 'Сервер успешно создан'
    else
      flash.now[:info] = 'Сервер не создан'
      render :new
    end
  end

  def edit; end

  def update
    # @server.user_id = current_user.id
    if @server.update_attributes(server_params)
      redirect_to @server, success: 'Сервер успешно изменён'
    else
      flash.now[:info] = 'Сервер не изменён'
      render :edit
    end
  end

  def destroy
    @server.destroy
    redirect_to @server, alert: 'Сервер успешно удален'
  end

  private

  def set_version
    @versions = Serverversion.pluck 'hronicle'
  end

  def set_server
    @server = Listserver.find(params[:id])
    acces_close unless @server.user_id == current_user.id
  end

  def acces_close
    redirect_to listservers_path, error: 'Доступ запрещен !!!'
  end

  def server_params
    params.require(:listserver).permit(:title, :urlServer, :dateStart, :version)
  end
end
