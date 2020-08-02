class CountryWorker

  include Sidekiq::Worker

  def perform(user_id)
    sleep 5
    user = User.find(user_id)
    country = Geocoder.search(user.current_sign_in_ip.to_s).first.country
    user.update(country: country)
  end
end