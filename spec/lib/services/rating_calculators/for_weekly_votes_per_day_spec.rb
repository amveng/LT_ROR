# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::RatingCalculators::ForWeeklyVotesPerDay do
  context 'Checking the calculation of ratings by the average per day for the week:' do
    it 'standard data for min step' do
      vote = create(:vote)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_min_step
      expect(result.round(3)).to eq(0.014)
    end

    it 'standard data for max step' do
      vote = create(:vote)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_max_step
      expect(result.round(4)).to eq(0.0029)
    end

    it 'change data for min step' do
      vote = create(:vote)
      vote = create(:vote, server: vote.server, date: 7.day.ago)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_min_step
      expect(result.round(3)).to eq(0.029)
    end

    it 'change data for max step' do
      vote = create(:vote)
      vote = create(:vote, server: vote.server, date: 7.day.ago)
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_max_step
      expect(result.round(4)).to eq(0.0057)
    end

    it 'limiting the maximum for min step' do
      vote = create(:vote)      
      70.times { vote = create(:vote, server: vote.server) }
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_min_step
      expect(result.round(3)).to eq(1)
    end

    it 'limiting the maximum for max step' do
      vote = create(:vote)
      700.times { vote = create(:vote, server: vote.server) }
      votes_for_this_server = Vote.where(server_id: vote.server.id)
      result = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server).calculate_achivement_max_step
      expect(result.round(4)).to eq(2)
    end
  end
end
