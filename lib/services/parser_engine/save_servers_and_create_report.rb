# frozen_string_literal: true

module Services
  module ParserEngine
    class SaveServersAndCreateReport
      attr_reader :array_of_new_servers, :url

      def initialize(array_of_new_servers, url)
        @array_of_new_servers = array_of_new_servers
        @url = url
      end

      def finishing_touch
        array_of_new_servers.each do |server|
          create_report(server) if server.save
        end
      end

      private

      def create_report(server)
        ParserMessage.create(name: url, typemsg: 'create server', body: "Сервер - #{server.title} - создан")
      end
    end
  end
end
