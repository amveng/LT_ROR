# frozen_string_literal: true

class Serverversion < ApplicationRecord
  has_many :servers

  validates :name, presence: true
end
