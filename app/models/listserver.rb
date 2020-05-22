# frozen_string_literal: true

class Listserver < ApplicationRecord
  validates :title, :urlServer, :dateStart, presence: true 
end
