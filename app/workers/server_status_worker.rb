class ServerStatusWorker
  include Sidekiq::Worker

  def perform
    servers_expires = Server.where(status_expires: ..Date.yesterday, status: 1..2)
    servers_expires.each do |f|
      f.update(status: 3)
    end
  end
end
