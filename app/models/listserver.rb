# frozen_string_literal: true

class Listserver < ApplicationRecord
  belongs_to :user

  auto_strip_attributes :title, squish: true

  validates :dateStart, :version, presence: true
  validates :title, uniqueness: true, length: { in: 4..42 }
  validates :urlServer, format: { with: /https/, message: 'Должен начинатся с "https"' }

  # scope :unpublish, lambda {
  #   where(publish: false)
  # }
end
