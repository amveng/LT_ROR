# frozen_string_literal: true

AutoStripAttributes::Config.setup do
  set_filter(capitalize: false) do |value|
    !value.blank? && value.respond_to?(:capitalize) ? value.capitalize : value
  end
end

class Server < ApplicationRecord
  mount_uploader :imageserver, ImageserverUploader
  belongs_to :user
  belongs_to :serverversion
  has_many :votes, dependent: :destroy
  has_many :server_views, dependent: :destroy

  auto_strip_attributes :title, squish: true, capitalize: true

  validates :status_expires, :datestart, :status, :publish,
            :rate, :title, presence: true
  validates :rate, numericality: { only_integer: true }
  validates :title, uniqueness: true, length: { in: 4..42 }
  validates :urlserver, url: { schemes: ['https'], public_suffix: true }
  validates :description, length: { maximum: 400 }

  scope :published, lambda {
    where(publish: 'published')
  }
  scope :vip, lambda {
    where(publish: 'published', status: 1..2).order(:status, datestart: :desc)
  }
  scope :rating, lambda {
    where(publish: 'published').order(rating: :desc)
  }
  scope :profile, lambda {
    order(updated_at: :desc)
  }
  scope :today, lambda {
    where(datestart: Date.today.midnight..(Date.today.midnight + 1.day))
  }
  scope :tomorrow, lambda {
    where(datestart: (Date.today.midnight + 1.day)..(Date.today.midnight + 2.day))
  }
  scope :yesterday, lambda {
    where(datestart: (Date.today.midnight - 1.day)..Date.today.midnight)
  }
end
