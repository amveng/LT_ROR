# frozen_string_literal: true

# ----------------------------------------------------------------------------
# Dear developer:

# As soon as you stop trying to optimize this code and 
# understand what mistake you made in taking on this business,
# please increment the number on the counter below for the following developer:

# number_of_hours_wasted_here = 42
# ----------------------------------------------------------------------------

class Numeric
  def max_value(max)
    if self > max
      max
    else
      self
    end
  end
end

class VoteWorker
  include Sidekiq::Worker
  MAX_COUNTED_VOTES_PER_DAY = 300
  MAX_COUNTED_VOTES_PER_WEEK = 100
  MAX_COUNTED_VOTES_PER_MONTH = 1000
  SECONDS_IN_YEAR = (60 * 60 * 24 * 356)

  def perform(server_id = nil, force = false)
    list_id = force ? Server.ids : [server_id]
    list_id.each do |server_id|
      @server = Server.find(server_id)
      @server.update(rating: calculate_rating_for_server(server_id))
    end
  end

  private

  def calculate_rating_for_server(server_id)
    votes_for_this_server = Vote.where(server_id: server_id)
    rating = [4]
    rating << ((@server.created_at - Time.now) / SECONDS_IN_YEAR).abs.max_value(0.99) - @server.status_before_type_cast
    rating << calculate_average_votes_per_day_for_last_week(calculate_votes_for_last_week(votes_for_this_server)) / 50
    rating << calculate_average_votes_per_day_for_last_week(calculate_votes_for_last_week(votes_for_this_server)).max_value(10) / 10
    rating << calculate_votes_for_last_day(votes_for_this_server) / MAX_COUNTED_VOTES_PER_DAY
    rating << calculate_votes_for_last_week(votes_for_this_server) / MAX_COUNTED_VOTES_PER_WEEK
    rating << calculate_votes_for_last_month(votes_for_this_server) / MAX_COUNTED_VOTES_PER_MONTH
    rating.reduce(:+).round(2)
  end

  def calculate_votes_for_last_day(votes_for_this_server)
    votes_for_this_server.where(created_at: Time.now.yesterday..Time.now).count.max_value(MAX_COUNTED_VOTES_PER_DAY)
  end

  def calculate_votes_for_last_week(votes_for_this_server)
    votes_for_this_server.where(date: 7.days.ago..0.days.ago).count.max_value(MAX_COUNTED_VOTES_PER_WEEK)
  end

  def calculate_average_votes_per_day_for_last_week(votes_weekly_count)
    (Float(votes_weekly_count) / 7).max_value(MAX_COUNTED_VOTES_PER_WEEK)
  end

  def calculate_votes_for_last_month(votes_for_this_server)
    votes_for_this_server.where(date: 30.days.ago..0.days.ago).count.max_value(MAX_COUNTED_VOTES_PER_MONTH)
  end
end
