# frozen_string_literal: true

class ServerStatusWorker
  include Sidekiq::Worker

  def perform
    servers_expires = Server.where(status_expires: ..Date.yesterday, status: 1..2)
    servers_expires.each do |f|
      f.normal!
    end

    while Server.top.count < 2
      server = Server.premiere.normal.sample
      break if server.blank?

      server.update(status: 1, status_expires: rand(3).days.after)
    end

    while Server.vip.count < 5
      server = Server.premiere.normal.sample
      break if server.blank?

      server.update(status: 2, status_expires: rand(3).days.after)
    end
  end
end
