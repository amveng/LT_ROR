# frozen_string_literal: true

module Services
  module ParserEngine
    class SearchByPatterns
      attr_reader :selected_data, :search_patterns

      def initialize(selected_data, search_patterns)
        @selected_data = selected_data
        @search_patterns = search_patterns
      end

      def collect_array
        array_of_match_numbers = []
        selected_data.each_with_index do |data, index|
          array_of_match_numbers << index if search_patterns.include? data
        end
        array_of_match_numbers
      end
    end
  end
end
