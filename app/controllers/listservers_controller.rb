# frozen_string_literal: true

class ListserversController < ApplicationController
  before_action :set_server, only: %i[show edit update destroy]
  @versions = Serverversion.pluck 'hronicle'
  def index
    @listservers = Listserver.all
  end

  def show; end

  def new
    @server = Listserver.new
  end

  def create
    @server = Listserver.new(server_params)
    if @server.save
      redirect_to listservers_path
    else
      render :new
    end
  end

  def edit; end

  def update
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

  def set_server
    @server = Listserver.find(params[:id])
    # @serverversions = Serverversion.find(@server.id)
  end

  def server_params
    params.require(:listserver).permit(:title, :urlServer, :dateStart)
  end
end
