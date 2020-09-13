# frozen_string_literal: true

class MainWorker
  include Sidekiq::Worker

  def perform
    (1..3).each do |s|
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

    ServerCheckWorker.perform_at(10.minutes.after)
    ServerCheckWorker.perform_at(12.hour.after)

    (1..(5 + rand(11))).each do |s|
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
