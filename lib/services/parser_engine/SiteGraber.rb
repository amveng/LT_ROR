# frozen_string_literal: true

module Services
  module ParserEngine
    class SiteGraber
      attr_reader :url

      def initialize(url)
        @url = url
      end

      def take
        Nokogiri::HTML(uri_open)
      rescue StandardError
        create_message
        false
      end

      private

      def uri_open
        URI.open(url)
      end

      def create_message
        ParserMessage.create(name: url, typemsg: 'no server', body: 'Сервер недоступен')
      end
    end
  end
end
