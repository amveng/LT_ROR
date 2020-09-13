# frozen_string_literal: true

class ServerCheckWorker
  include Sidekiq::Worker

  def perform
    servers = Server.all
    servers.each do |server|
      next if server.failed_checks > 30

      @url_server = server.urlserver
      begin
        @uri = URI.open(@url_server)
      rescue StandardError
        if server.failed_checks > 1
          server.publish = 'failed'
          server.failed = 'сервер недоступен'
          server.publish = 'arhiv' if server.failed_checks > 29
        end
        server.failed_checks += 1
      else
        @doc = Nokogiri::HTML(@uri)
        title = @doc.title
        if server.description.blank?
          server.description = title[0..399] if title.present?
        end

        server.failed_checks = 0 if server.failed_checks.positive?
        if server.publish == 'failed' && server.failed == 'сервер недоступен'
          server.publish = 'published'
          server.failed = ''
        end
        server.publish = 'published' if server.publish == 'create'


        if server.status > 2 && baner_check?
          unless LtcBilling.exists?(product_name: server.title, description: 'Акция премиум за банер')
            server.status_expires = Date.today + 10.days
            server.status = 2
            LtcBilling.create(
              product_name: server.title,
              description: 'Акция премиум за банер',
              amount: 0.0,
              user_id: server.user.id
            )
          end
        end
      end
      server.save
    end
  end

  private

  def baner_check?
    @doc.css('a').each do |a|
      if a.values.to_s.include?('https://lineagetop.com') && a.children.to_s.include?('https://lineagetop.com')
        return true
      end
    end
    false
  end
end
