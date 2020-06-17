class VotesController < ApplicationController
  before_action :authenticate_user!

  def create

    @vote = Vote.new
    @vote.listserver_id = params[:id]
    @vote.user_id = current_user.id
    @vote.date = Date.today
    if @vote.save
      redirect_to listservers_path, success: 'Vote ok'
    else
      redirect_to listservers_path, danger: 'Vote not ok'
    end
  end

  def set_rating
    unless Vote.exists?(listserver_id: @server.id, date: Date.today)
      @rating = 1
    end
  end
end