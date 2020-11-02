# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new
    vote.server_id = params[:id]
    vote.user_id = current_user.id
    vote.date = Date.today
    vote.user_ip = current_user.current_sign_in_ip
    vote.country = current_user.country || 'Неопределено'
    if current_user.votetime < DateTime.now
      current_user.votetime = DateTime.now + 12.hours
      force = Vote.find_by(date: Date.today).blank?
      VoteWorker.perform_async(params[:id], force)
      if vote.save && current_user.save
        redirect_to server_path(params[:id]), success: 'Вы проголосовали'
      else
        voting_failed
      end
    else
      voting_failed
    end
  end

  private

  def voting_failed
    redirect_to servers_path, danger: 'Голосование не удалось'
  end
end
