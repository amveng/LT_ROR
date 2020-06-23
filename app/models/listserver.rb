# frozen_string_literal: true

AutoStripAttributes::Config.setup do
  set_filter(capitalize: false) do |value|
    !value.blank? && value.respond_to?(:capitalize) ? value.capitalize : value
  end
end

class Listserver < ApplicationRecord
  belongs_to :user
  belongs_to :serverversion
  has_many :votes, dependent: :destroy

  auto_strip_attributes :title, squish: true, capitalize: true

  validates :dateStart, :urlServer, :rate, :title, presence: true
  validates :rate, numericality: { only_integer: true }
  validates :title, uniqueness: true, length: { in: 4..42 }
  validates :urlServer, format: { with: /https/, message: 'Должен начинатся с "https"' }

 
  # scope :unpublish, lambda {
  #   where(publish: false)
  # }


end
