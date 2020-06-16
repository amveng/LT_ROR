# frozen_string_literal: true

AutoStripAttributes::Config.setup do
  set_filter(force_capitalize: false) do |value|
    !value.blank? && value.respond_to?(:capitalize) && value.capitalize
  end
end

class Listserver < ApplicationRecord
  belongs_to :user
  has_many :polls, dependent: :destroy

  auto_strip_attributes :title, squish: true, force_capitalize: true

  validates :dateStart, :version, presence: true
  validates :title, uniqueness: true, length: { in: 4..42 }
  validates :urlServer, format: { with: /https/, message: 'Должен начинатся с "https"' }

 
  # scope :unpublish, lambda {
  #   where(publish: false)
  # }


end
