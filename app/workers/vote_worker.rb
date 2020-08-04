# frozen_string_literal: true

class VoteWorker
  include Sidekiq::Worker

  def perform(server_id)
    list_id = if Vote.find_by(date: Date.today).blank?
                Server.ids
              else
                [server_id]
              end
    list_id.each do |f|
      server = Server.find(f)
      time_range = DateTime.now.yesterday..DateTime.now
      date_range = 7.days.ago..0.days.ago
      votes_weekly_count = Vote.where(server_id: f, date: date_range).count
      votes_days_count = Vote.where(server_id: f, created_at: time_range).count
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
    end
  end
end
