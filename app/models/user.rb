# frozen_string_literal: true

# chto to
class User < ApplicationRecord
  has_many :listservers

  TEMP_EMAIL_PREFIX = 'change@me'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :trackable, :lockable,
         :omniauthable, omniauth_providers: %i[vkontakte github google_oauth2]

  def self.create_from_provider_data(provider_data)
    puts '-----------------------------------------------------------'
    puts provider_data.info
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      puts '-----------------------------------------------------------'
      puts provider_data.info
      # user.uid = provider_data.uid
      user.email = if provider_data.info.email.nil?
                     "#{TEMP_EMAIL_PREFIX}-#{provider_data.uid}-#{provider_data.provider}.com"
                   else
                     provider_data.info.email
                   end
      user.password = Devise.friendly_token[0, 20]
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
end
