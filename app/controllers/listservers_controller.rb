# frozen_string_literal: true

class ListserversController < ApplicationController
  def index
    @listservers = Listserver.all
  end
  def show
    @server = Listserver.find(params[:id])
  end
end
