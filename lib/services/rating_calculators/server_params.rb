# frozen_string_literal: true

module Services::RatingCalculators
  class ServerParams
    SECONDS_IN_YEAR = 30_758_400
    private_constant :SECONDS_IN_YEAR
    attr_reader :server

    def initialize(server)
      @server = server
    end

    def calculate
      rating_for_server_age - rating_for_server_status
    end

    private

    def rating_for_server_age
      ((server.created_at - Time.now) / SECONDS_IN_YEAR).abs.max_value(0.99)
    end

    def rating_for_server_status
      server.status_before_type_cast
    end
  end
end
