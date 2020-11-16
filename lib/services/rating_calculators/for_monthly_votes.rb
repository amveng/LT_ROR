# frozen_string_literal: true

module Services::RatingCalculators
  class ForMonthlyVotes
    MAX_COUNTED_VOTES_PER_MONTH = 1000.0
    private_constant :MAX_COUNTED_VOTES_PER_MONTH
    attr_reader :votes_for_this_server

    def initialize(votes_for_this_server)
      @votes_for_this_server = votes_for_this_server
    end

    def calculate
      votes_for_last_month(votes_for_this_server) / MAX_COUNTED_VOTES_PER_MONTH
    end

    private

    def votes_for_last_month(votes_for_this_server)
      votes_for_this_server.where(date: 30.days.ago..0.days.ago).count.max_value(MAX_COUNTED_VOTES_PER_MONTH)
    end
  end
end
