# frozen_string_literal: true

class CleanerWorker
  include Sidekiq::Worker

  def perform
    vote = Vote.where(token: nil)
    vote.destroy_all
  end
end
