# frozen_string_literal: true

module Services::RatingCalculators
  class ForWeeklyVotes
    MAX_COUNTED_VOTES_PER_WEEK = 300.0
    private_constant :MAX_COUNTED_VOTES_PER_WEEK
    attr_reader :votes_for_this_server

    def initialize(votes_for_this_server)
      @votes_for_this_server = votes_for_this_server
    end

    def calculate
      votes_for_last_week(votes_for_this_server) / MAX_COUNTED_VOTES_PER_WEEK
    end

    private

    def votes_for_last_week(votes_for_this_server)
      votes_for_this_server.where(date: 7.days.ago..0.days.ago).count.max_value(MAX_COUNTED_VOTES_PER_WEEK)
    end
  end
end
