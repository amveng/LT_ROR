# frozen_string_literal: true

class VoteWorker
  include Sidekiq::Worker

  def perform(server_id = nil, force = false)
    list_id =
      if force
        Server.ids
      else
        [server_id]
      end
    list_id.each do |f|
      server = Server.find(f)
      time_range = Time.now.yesterday..Time.now
      date_range = 7.days.ago..0.days.ago
      votes_weekly_count = Vote.where(server_id: f, date: date_range).count
      votes_days_count = Vote.where(server_id: f, created_at: time_range).count
      votes_month_count = Vote.where(server_id: f, date: 30.days.ago..0.days.ago).count
      votes_weekly_average = Float(votes_weekly_count) / 7
      long_day = ((server.created_at - Time.now) / (60 * 60 * 24 * 356)).abs
      votes_weekly_average = 100 if votes_weekly_average > 100
      long_day = 0.99 if long_day > 0.99
      rating = 4 - server.status_before_type_cast + long_day + votes_weekly_average / 50
      votes_weekly_average = 10 if votes_weekly_average > 10
      rating += votes_weekly_average / 10
      votes_weekly_count = 100 if votes_weekly_count > 100
      rating += votes_weekly_count / 100
      votes_days_count = 300 if votes_days_count > 300
      rating += votes_days_count / 300
      votes_month_count = 1000 if votes_month_count > 1000
      rating += votes_month_count / 1000
      rating = rating.round(2)
      server.update_attributes(rating: rating)
    end
  end
end
