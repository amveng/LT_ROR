# frozen_string_literal: true

# chto to
class User < ApplicationRecord
  has_many :listservers
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :trackable, :lockable,
         :omniauthable,
         omniauth_providers: %i[vkontakte github google_oauth2 facebook]

  def self.create_from_provider_data(provider_data)
    # puts '-----------------------------------------------------------'
    puts provider_data.info
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      # puts '-----------------------------------------------------------'
      puts provider_data.info
      # user.uid = provider_data.uid
      # if User.find_by(email: provider_data.info.email)
      #   puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
      # else
      #   puts 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
        
      # end
      user.email = provider_data.info.email || "change@me-#{provider_data.uid}-#{provider_data.provider}.com"
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
