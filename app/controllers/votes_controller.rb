class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new
    @vote.listserver_id = params[:id]
    @vote.user_id = current_user.id
    @vote.date = Date.today
    if current_user.votetime < DateTime.now
      current_user.votetime = DateTime.now + 12.hours
      if @vote.save && current_user.save
        redirect_to listservers_path, success: 'Вы проголосовали'
      else
        voting_failed
      end
    else
      voting_failed
    end

  end

  # def set_rating
  #   unless Vote.exists?(listserver_id: @server.id, date: Date.today)
  #     @rating = 1
  #   end
  # end

  private

  def voting_failed
    redirect_to listservers_path, danger: 'Голосование не удалось'
  end


end