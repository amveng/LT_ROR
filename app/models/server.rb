# frozen_string_literal: true

# == Schema Information
#
# Table name: servers
#
#  id               :bigint           not null, primary key
#  rating           :decimal(3, 2)    default(1.0)
#  publish          :string           default("create"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string(42)
#  urlserver        :string
#  datestart        :datetime
#  user_id          :bigint
#  rate             :integer          default(1), not null
#  serverversion_id :bigint           default(1), not null
#  status           :integer          default(3), not null
#  imageserver      :string
#  description      :text
#  status_expires   :date             default(Wed, 01 Jan 2020), not null
#  failed           :text
#  token            :string
#
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

  before_create lambda {
    self.token = generate_token
  }

  auto_strip_attributes :title, squish: true, capitalize: true

  validates :status_expires, :datestart, :status, :publish, presence: true
  validates :rate, numericality: { only_integer: true }
  validates :title, :urlserver, uniqueness: true, length: { in: 4..42 }
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

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless Server.exists?(token: token)
    end
  end
end
