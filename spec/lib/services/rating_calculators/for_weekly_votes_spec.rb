# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::RatingCalculators::ForWeeklyVotes do
  context 'Checking the calculation of ratings by votes per week:' do
    it 'standard data' do
      vote = create(:vote)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(0.003)
    end

    it 'change in the number of votes per week' do
      vote = create(:vote)
      vote = create(:vote, server: vote.server, date: 7.day.ago)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(0.007)
    end

    it 'limiting the maximum' do
      server = create(:server)
      301.times { create(:vote, server: server) }
      votes_for_this_server = Vote.where(server_id: server.id)
      result = Services::RatingCalculators::ForWeeklyVotes.new(votes_for_this_server).calculate
      expect(result.round(3)).to eq(1)
    end
  end
end
