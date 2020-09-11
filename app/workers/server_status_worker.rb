# frozen_string_literal: true

class ServerStatusWorker
  include Sidekiq::Worker

  def perform
    servers_expires = Server.where(status_expires: ..Date.yesterday, status: 1..2)
    servers_expires.each do |f|
      f.update(status: 3)
    end

    while Server.where(status: 1).count < 2
      server = Server.premiere.novip.sample
      break if server.blank?

      server.update(status: 1, status_expires: rand(3).days.after)
    end

    while Server.where(status: 2).count < 5
      server = Server.premiere.novip.sample
      break if server.blank?

      server.update(status: 2, status_expires: rand(3).days.after)
    end
  end
end
