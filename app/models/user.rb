# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  baned                  :boolean          default(FALSE), not null
#  provider               :string(50)       default("email"), not null
#  uid                    :string(200)      default(""), not null
#  username               :string(50)       default(""), not null
#  votetime               :datetime         default(Wed, 01 Jan 2020 03:00:00 MSK +03:00), not null
#  country                :string
#
class User < ApplicationRecord
  has_many :servers
  has_many :votes
  has_many :ltc_billing
  has_one :profile, dependent: :destroy

  before_create :build_profile
  
  accepts_nested_attributes_for :profile

  auto_strip_attributes :username, squish: true
  validates :username, :email, length: { in: 4..42 }
  validates :votetime, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :trackable, :lockable,
         :omniauthable, :async,
         omniauth_providers: %i[vkontakte github google_oauth2 facebook email faker]


  scope :nofaker, lambda {
    where.not(provider: 'faker')
  }

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      if User.default_scoped.exists?(email: provider_data.info.email)
        user.email = "**#{provider_data.provider}-#{provider_data.info.email}"
      else
        user.email = provider_data.info.email || "*#{provider_data.uid}@#{provider_data.provider}.com"
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
      if params[:password_confirmation].blank?
        params.delete(:password_confirmation)
      end
    end
    update_attributes(params)
  end
end
