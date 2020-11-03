# frozen_string_literal: true

class VoteFakeWorker
  include Sidekiq::Worker

  def perform(count_vote = 100)
    count_vote = 0 if Vote.where(date: Date.today).count > rand(2400)
    while count_vote.positive?

      koef = 1
      user = User.faker.sample
      server = Server.published.sample
      koef += server.rating
      if server.datestart > 0.days.ago && server.datestart < 7.days.after
        koef += 4
      end
      if server.datestart > 7.days.ago && server.datestart < 0.days.after
        koef += 2
      end
      if koef > rand(1000) / 100.0
        Vote.create(
          server_id: server.id,
          user_id: user.id,
          date: Date.today,
          country: user.country
        )
        count_vote -= 1
      end
      if koef > rand(700) / 100.0
        ServerView.create(
          server_id: server.id,
          viewer: 'faker',
          date: Date.today
        )
      end

    end
    VoteWorker.perform_async(nil, true)
  end
end
