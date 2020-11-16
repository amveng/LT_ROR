# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq'
require 'sidekiq/testing/inline'

RSpec.describe VoteWorker, type: :worker do
  context 'check:' do
    it 'result of work' do
      vote = create(:vote)
      VoteWorker.perform_async(vote.server.id)
      result = Server.find(vote.server.id).rating
      expect(result.round(2)).to eq(1.03)
    end
  end
end
