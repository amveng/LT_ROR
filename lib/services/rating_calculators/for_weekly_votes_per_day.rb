# frozen_string_literal: true

module Services::RatingCalculators
  class ForWeeklyVotesPerDay
    MAX_COUNTED_VOTES_PER_WEEK = 100.0
    private_constant :MAX_COUNTED_VOTES_PER_WEEK
    attr_reader :votes_for_this_server

    def initialize(votes_for_this_server)
      @votes_for_this_server = votes_for_this_server
      @votes_for_last_week = votes_for_last_week
    end

    def calculate_achivement_max_step
      average_votes_per_day_for_last_week(votes_for_last_week) / MAX_COUNTED_VOTES_PER_WEEK * 2
    end

    def calculate_achivement_min_step
      (average_votes_per_day_for_last_week(votes_for_last_week) / 10).max_value(1)
    end

    private

    def votes_for_last_week
      votes_for_this_server.where(date: 7.days.ago..0.days.ago).count
    end

    def average_votes_per_day_for_last_week(votes_for_last_week)
      (Float(votes_for_last_week) / 7).max_value(MAX_COUNTED_VOTES_PER_WEEK)
    end
  end
end
