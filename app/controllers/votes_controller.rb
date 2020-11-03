# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new(vote_params)

    
    ActiveRecord::Base.transaction do
      current_user.set_next_votetime!
      current_user.save!
      vote.save!
    end
    force = Vote.find_by(date: Date.today).blank?
    VoteWorker.perform_async(params[:id], force)
    redirect_to server_path(params[:id]), success: 'Вы проголосовали'
    rescue StandardError
    voting_failed    
  end

  private

  def voting_failed
    redirect_to servers_path, danger: 'Голосование не удалось'
  end

  def vote_params
    {
      server_id: params[:id],
      user_id: current_user.id,
      date: Date.today,
      user_ip: current_user.current_sign_in_ip,
      country: current_user.country || 'Неопределено'
    }
  end
end
