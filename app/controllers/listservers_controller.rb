# frozen_string_literal: true

class ListserversController < ApplicationController
  before_action :set_version
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_server, only: %i[show edit update destroy]
  def index
    @listservers = Listserver.all
  end

  def show; end

  def new
    # redirect_to new_user_session_path unless user_signed_in?
    @server = Listserver.new
  end

  def create
    @server = Listserver.new(server_params)
    @server.user_id = current_user.id
    if @server.save
      redirect_to listservers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @server.user_id = current_user.id
    if @server.update_attributes(server_params)
      redirect_to listservers_path
    else
      render :edit
    end
  end

  def destroy
    @server.destroy
    redirect_to @server
  end

  private

  def set_version
    @versions = Serverversion.pluck 'hronicle'
  end

  def set_server
    @server = Listserver.find(params[:id])
  end

  def server_params
    params.require(:listserver).permit(:title, :urlServer, :dateStart, :version)
  end
end

# def check_login
#   redirect_to new_user_session_path unless user_signed_in?
# end
