# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::RatingCalculators::ServerParams do
  context 'checking rating calculations based on server data: ' do
    it 'standard data' do
      server = create(:server)
      result = Services::RatingCalculators::ServerParams.new(server).calculate
      expect(result.round(2)).to eq(-3)
    end

    it 'change of creation date' do
      server = create(:server, created_at: 1.year.ago)
      result = Services::RatingCalculators::ServerParams.new(server).calculate
      expect(result.round(2)).to eq(-2.01)
    end

    it 'limiting the maximum' do
      server = create(:server, created_at: 2.year.ago)
      result = Services::RatingCalculators::ServerParams.new(server).calculate
      expect(result.round(2)).to eq(-2.01)
    end

    it 'server status change' do
      server = create(:server, status: 1)
      result = Services::RatingCalculators::ServerParams.new(server).calculate
      expect(result.round(2)).to eq(-1)
    end
  end
end
