class PruningServerViewWorker
  include Sidekiq::Worker

  def perform
    vote = ServerView.where(date: ..9.days.ago)
    vote.delete_all
  end
end
