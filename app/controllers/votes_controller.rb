# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new
    @vote.server_id = params[:id]
    @vote.user_id = current_user.id
    @vote.date = Date.today
    @vote.country = current_user.country || %w[ru by ua].sample
    if current_user.votetime < DateTime.now
      current_user.votetime = DateTime.now + 12.hours
      # + 12.hours
      VoteWorker.perform_async(params[:id])
      if @vote.save && current_user.save
        redirect_to server_path(params[:id]), success: 'Вы проголосовали'
      else
        voting_failed
      end
    else
      voting_failed
    end
  end

  # def set_rating
  #   unless Vote.exists?(server_id: @server.id, date: Date.today)
  #     @rating = 1
  #   end
  # end

  private

  def voting_failed
    redirect_to servers_path, danger: 'Голосование не удалось'
  end
end
