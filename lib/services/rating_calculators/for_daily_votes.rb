# frozen_string_literal: true

module Services::RatingCalculators
  class ForDailyVotes
    MAX_COUNTED_VOTES_PER_DAY = 100.0
    private_constant :MAX_COUNTED_VOTES_PER_DAY
    attr_reader :votes_for_this_server

    def initialize(votes_for_this_server)
      @votes_for_this_server = votes_for_this_server
    end

    def calculate
      votes_for_last_day(votes_for_this_server) / MAX_COUNTED_VOTES_PER_DAY
    end

    private

    def votes_for_last_day(votes_for_this_server)
      votes_for_this_server.where(created_at: Time.now.yesterday..Time.now).count.max_value(MAX_COUNTED_VOTES_PER_DAY)
    end
  end
end
