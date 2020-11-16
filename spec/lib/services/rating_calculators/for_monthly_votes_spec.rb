# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::RatingCalculators::ForMonthlyVotes do
  context 'Checking the calculation of ratings by votes per month:' do
    it 'standard data' do
      vote = create(:vote)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForMonthlyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(0.001)
    end

    it 'change in the number of votes per month' do
      vote = create(:vote)
      vote = create(:vote, server: vote.server, date: 30.day.ago)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForMonthlyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(0.002)
    end

    it 'limiting the maximum' do
      vote = create(:vote)
      1000.times { vote = create(:vote, server: vote.server) }
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForMonthlyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(1)
    end
  end
end
