# frozen_string_literal: true

module Services
  module ParserEngine
    class ServersBuilder
      attr_reader :array_of_match_numbers, :selected_data, :site

      def initialize(array_of_match_numbers, selected_data, site)
        @array_of_match_numbers = array_of_match_numbers
        @selected_data = selected_data
        @site = site
      end

      def make
        array_of_new_servers = []
        array_of_match_numbers.each do |index|
          server = Server.new(server_data(index))
          array_of_new_servers << server if server.valid?
        end
        array_of_new_servers
      end

      private

      def server_data(index)
        {
          serverversion: Serverversion.find_by(name: normalized_serverversion(selected_data[index])),
          rate: normalized_rate(selected_data[index + site.number_rate]),
          datestart: normalized_date(selected_data[index + site.number_date]),
          title: selected_data[index + site.number_name],
          urlserver: "https://#{selected_data[index + site.number_name]}"
        }
      end

      def normalized_date(date)
        date = "#{date[0, 6]}20#{date[6, 2]}" if date.length == 8
        date
      end

      def normalized_rate(rate)
        rate = rate.delete '^0-9'
        rate.to_i
      end

      def normalized_serverversion(version)
        version = 'Interlude +' if version == 'Interlude+'
        version = 'High Five +' if version == 'High Five+'
        version
      end
    end
  end
end
