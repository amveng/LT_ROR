# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new
    @vote.listserver_id = params[:id]
    @vote.user_id = current_user.id
    @vote.date = Date.today
    if current_user.votetime < DateTime.now
      current_user.votetime = DateTime.now
      # + 12.hours
      # -------
      f = @vote.listserver_id
      server = Listserver.find(f)
      votes_weekly_count = Vote.where(listserver_id: f, date: 7.days.ago..0.days.ago).count
      votes_days_count = Vote.where(listserver_id: f, created_at: DateTime.now.yesterday..DateTime.now).count
      votes_weekly_average = votes_weekly_count.to_f / 7
      long_day = ((server.created_at - DateTime.now) / (60 * 60 * 24 * 356)).abs
      votes_weekly_average = 1000 if votes_weekly_average > 1000
      long_day = 0.99 if long_day > 0.99
      rating = 4 - server.status + long_day + votes_weekly_average / 500
      rating += 1 if votes_weekly_average > 10
      rating += 1 if votes_weekly_count > 100
      rating += 1 if votes_days_count > 1000
      rating += 1 if votes_days_count > 3000
      rating = rating.round(2)
      server.update_attributes(rating: rating)
      # ----------------
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
