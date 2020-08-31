# frozen_string_literal: true

class Country < ActiveRecord::Base
  validates :code, length: { maximum: 5 }, uniqueness: true
  validates :name, length: { maximum: 100 }
  validates :iso3, length: { maximum: 3 }
  validates :iso3, :name, :code, :numeric, presence: true
end
