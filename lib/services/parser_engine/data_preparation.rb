# frozen_string_literal: true

module Services
  module ParserEngine
    class DataPreparation
      attr_reader :document, :css_selector

      def initialize(document, css_selector)
        @document = document
        @css_selector = css_selector
      end

      def selected
        selected_data = []
        document.css(css_selector).each do |item|
          selected_data << item.content.strip
        end
        selected_data
      end
    end
  end
end
