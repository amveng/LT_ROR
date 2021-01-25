# frozen_string_literal: true

module Services::BannerOperations
  class CalculationOfBannerPayment
    PAYMENT_PER_DAY = {
      top: 3,
      menu: 1,
      left: 1.5,
      right: 1.5
    }
    private_constant :PAYMENT_PER_DAY
    attr_reader :date_start, :date_end, :position

    def initialize(date_start, date_end, position)
      @date_start = date_start
      @date_end = date_end
      @position = position
    end

    def calculate
      (date_end - date_start + 1).to_i * (PAYMENT_PER_DAY[position.to_sym] || 0)
    end
  end
end
