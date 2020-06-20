# frozen_string_literal: true

# chto to
class User < ApplicationRecord
  has_many :listservers
  has_many :votes

  auto_strip_attributes :username, squish: true

  validates :username, length: { in: 4..42 }
  validates :email, length: { in: 6..65 }
  validates :votetime, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :trackable, :lockable,
         :omniauthable,
         omniauth_providers: %i[vkontakte github google_oauth2 facebook email]

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

  # Проверка не забанен ли пользователь
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
