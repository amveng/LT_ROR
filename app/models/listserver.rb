# frozen_string_literal: true

class Listserver < ApplicationRecord
  belongs_to :user
  scope :unpublish, lambda {
    where(publish: false)
  }
  validates :title, :status, :urlServer, :dateStart, :version, presence: true
end
