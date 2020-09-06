# frozen_string_literal: true

class FakeUserWorker
  include Sidekiq::Worker

  def perform(quantity = 1)
    quantity.times do
      user = User.new
      user.username = Faker::Name.name
      user.email = Faker::Internet.email while User.exists?(email: user.email) || user.email.blank?
      user.password = 'faker315'
      user.provider = 'faker'
      user.country = case rand(10)
                     when 1..5
                       'RU'
                     when 6
                       'BY'
                     when 7
                       'UA'
                     else
                       Country.pluck('code').sample
                     end

      user.skip_confirmation!
      user.save
    end
  end
end
