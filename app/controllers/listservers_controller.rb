# frozen_string_literal: true

class ListserversController < ApplicationController
  # layout false
  before_action :set_version
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_server, only: %i[show edit update destroy]
  before_action :check_new_server, only: %i[new]
  def index
    @listservers = Listserver.all
  end

  def show
    @vote = Poll.find_or_create_by(listserver_id: @server.id, date: Date.today)
  end

  def new
    @server = Listserver.new
  end

  def create
    @server = Listserver.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to listservers_path, success: 'Сервер успешно создан'
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

  def check_new_server
    acces_close if @listservers_user.pluck('publish').include? false
  end

  def set_version
    @versions = Serverversion.pluck 'hronicle'
  end

  def set_server
    @server = Listserver.find(params[:id])
    # acces_close unless @server.user_id == current_user.id
  end

  def acces_close
    redirect_to listservers_path, danger: 'Доступ запрещен !!!'
  end

  def server_params
    params.require(:listserver).permit(:title, :urlServer, :dateStart, :version)
  end
end
