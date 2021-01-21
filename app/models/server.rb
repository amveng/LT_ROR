# frozen_string_literal: true

AutoStripAttributes::Config.setup do
  set_filter(capitalize: false) do |value|
    !value.blank? && value.respond_to?(:capitalize) ? value.capitalize : value
  end
end

class Server < ApplicationRecord
  mount_uploader :imageserver, ImageserverUploader
  belongs_to :user, optional: true
  belongs_to :serverversion
  has_many :votes, dependent: :destroy
  has_many :banners, dependent: :destroy
  has_many :server_views, dependent: :destroy

  enum status: { top: 1, vip: 2, normal: 3 }

  enum publish: { created: 0, unverified: 1, failed: 2, published: 3, arhiv: 4 }

  before_create lambda {
    self.token = generate_token
  }

  auto_strip_attributes :title, squish: true, capitalize: true

  validates :status_expires, :failed_checks, :datestart, :status, :publish, presence: true
  validates :rate, :failed_checks, numericality: { only_integer: true }
  validates :title, :urlserver, uniqueness: true, length: { in: 4..42 }
  validates :urlserver, url: { schemes: ['https'], public_suffix: true }
  validates :description, length: { maximum: 400 }

  scope :not_working,
        lambda {
          where(failed_checks: 1..)
        }
  scope :premiere,
        lambda {
          where(datestart: 7.days.ago..7.days.after)
        }
  scope :already_opened,
        lambda {
          where(datestart: 7.days.ago..0.days.after).order(:status, datestart: :desc)
        }
  scope :open_soon,
        lambda {
          where(datestart: 0.days.after..7.days.after).order(:status, datestart: :asc)
        }
  scope :rating,
        lambda {
          order(rating: :desc)
        }
  scope :profile,
        lambda {
          order(updated_at: :desc)
        }

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless Server.exists?(token: token)
    end
  end
end
