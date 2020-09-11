# frozen_string_literal: true

class VoteFakeWorker
  include Sidekiq::Worker

  def perform(count_vote = 100)
    count_vote = 0 if Vote.where(date: Date.today).count > 2300
    while count_vote.positive?

      koef = 1
      user = User.faker.sample
      server = Server.published.sample
      koef += server.rating
      if server.datestart > 7.days.ago && server.datestart < 7.days.after
        koef += 3
      end
      if koef > rand(1000) / 100.0
        code = Country.find_by(code: user.country)
        country = if code.blank?
                    'Неопределено'
                  else
                    code.name
                  end
        Vote.create(
          server_id: server.id,
          user_id: user.id,
          date: Date.today,
          country: country
        )
        count_vote -= 1
      end
      ServerView.create(
        server_id: server.id,
        viewer: 'faker',
        date: Date.today
      )

    end
    VoteWorker.perform_async(server.id, true)
  end
end
