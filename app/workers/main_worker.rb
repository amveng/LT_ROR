# frozen_string_literal: true

class MainWorker
  include Sidekiq::Worker

  def perform
    (0..2).each do |s|
      next if ParserMessage.exists?(
        name: 'Main',
        typemsg: 'task',
        date: Date.today + s.days
      )

      ParserMessage.create(
        name: 'Main',
        typemsg: 'task',
        body: "main task start in - #{Date.today + s.days + 4.hour}",
        date: Date.today + s.days
      )

      MainWorker.perform_at(Date.today + s.days + 4.hour)
    end

    ParserServerWorker.perform_at(1.minutes.after)

    ServerStatusWorker.perform_at(Date.tomorrow + 1.minute)

    (1..23).each do |s|
      VoteFakeWorker.perform_at(s.hour.after)
    end

    ParserMessage.create(
      name: 'Main',
      typemsg: 'complite',
      body: 'complite main',
      date: Date.today
    )
  end
end
