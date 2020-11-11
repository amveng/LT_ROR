# frozen_string_literal: true

class User < ApplicationRecord
  has_many :servers
  has_many :petitions
  has_many :votes, dependent: :destroy
  has_many :ltc_billing
  has_one :profile, dependent: :destroy

  before_create :build_profile

  accepts_nested_attributes_for :profile

  auto_strip_attributes :username, squish: true
  validates :username, :email, length: { in: 4..42 }
  validates :next_votetime, presence: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :validatable,
         :trackable,
         :lockable,
         :omniauthable,
         :async,
         omniauth_providers: %i[vkontakte github google_oauth2 facebook email faker]

  scope :nofaker,
        lambda {
          where.not(provider: 'faker')
        }

  scope :faker,
        lambda {
          where(provider: 'faker')
        }

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email =
        if User.default_scoped.exists?(email: provider_data.info.email)
          "**#{provider_data.provider}-#{provider_data.info.email}"
        else
          provider_data.info.email || "*#{provider_data.uid}@#{provider_data.provider}.com"
        end
      user.password = Devise.friendly_token[0, 20]
      user.username = provider_data.info.name
      user.skip_confirmation!
    end
  end

  def account_active?
    !baned?
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :account_inactive
  end

  # bypasses Devise requirement to re-enter current password to edit
  def update_with_password(params = {})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

  class UserCantVoteYet < StandardError; end

  def set_next_votetime!
    raise UserCantVoteYet if next_votetime >= Time.current

    self.next_votetime = Time.current + 12.hours
  end
end
