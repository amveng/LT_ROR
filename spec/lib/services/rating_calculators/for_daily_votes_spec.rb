# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::RatingCalculators::ForDailyVotes do
  context 'Verification of rating calculations based on daily votes data:' do
    it 'standard data' do
      vote = create(:vote)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForDailyVotes.new(votes_for_this_server).calculate
      expect(result.round(2)).to eq(0.01)
    end

    it 'change in the number of votes per day' do
      vote = create(:vote)
      vote = create(:vote, server: vote.server)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForDailyVotes.new(votes_for_this_server).calculate
      expect(result.round(2)).to eq(0.02)
    end

    it 'limiting the maximum' do
      vote = create(:vote)
      100.times { vote = create(:vote, server: vote.server) }
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForDailyVotes.new(votes_for_this_server).calculate
      expect(result.round(2)).to eq(1)
    end
  end
end
