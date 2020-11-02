# frozen_string_literal: true

class CountryWorker
  include Sidekiq::Worker

  def perform(user_id)
    sleep 1
    user = User.find(user_id)
    begin
      country = Geocoder.search(user.current_sign_in_ip.to_s).first.country || 'Неопределено'
    rescue StandardError
      country = 'Неопределено'
    end
    user.update(country: country) if country.present?
  end
end
