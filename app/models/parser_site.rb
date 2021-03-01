# frozen_string_literal: true

class ParserSite < ApplicationRecord
  validates :url, uniqueness: true
  validates :url, :css_selector, :number_name, :number_date, :number_rate, presence: true
end
