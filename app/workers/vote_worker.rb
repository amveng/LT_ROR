# frozen_string_literal: true

# ----------------------------------------------------------------------------
# Dear developer:
#
# As soon as you stop trying to optimize this code and
# understand what mistake you made in taking on this business,
# please increment the number on the counter below for the following developer:
#
# number_of_hours_wasted_here = 42
# ----------------------------------------------------------------------------

class VoteWorker
  include Sidekiq::Worker

  def perform(server_id = nil, force = false)
    list_id = force ? Server.ids : [server_id]
    list_id.each do |server_id|
      server = Server.find(server_id)
      server.update(rating: calculate_rating_for_server(server))
    end
  end

  private

  def calculate_rating_for_server(server)
    votes_for_this_server = Vote.where(server_id: server.id)
    rating_components = [4]
    rating_components << Services::RatingCalculators::ServerParams.new(server).calculate
    rating_calulator_for_weekly_votes_per_day = Services::RatingCalculators::ForWeeklyVotesPerDay.new(votes_for_this_server)
    rating_components << rating_calulator_for_weekly_votes_per_day.calculate_achivement_min_step
    rating_components << rating_calulator_for_weekly_votes_per_day.calculate_achivement_max_step
    rating_components << Services::RatingCalculators::ForDailyVotes.new(votes_for_this_server).calculate
    rating_components << Services::RatingCalculators::ForWeeklyVotes.new(votes_for_this_server).calculate
    rating_components << Services::RatingCalculators::ForMonthlyVotes.new(votes_for_this_server).calculate    
    rating_components.sum.round(2)
  end
end
