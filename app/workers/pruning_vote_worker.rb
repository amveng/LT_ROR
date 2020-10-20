class PruningVoteWorker
  include Sidekiq::Worker

  def perform
    vote = Vote.where(date: ..31.days.ago)
    vote.delete_all
  end
end
