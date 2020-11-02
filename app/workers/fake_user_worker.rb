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
      user.country = case rand(300)
                     when 1..146
                       'Russia'
                     when 146..149
                       'Armenia'
                     when 149..159
                       'Azerbaijan'
                     when 159..169
                       'Belarus'
                     when 169..186
                       'Kazakhstan'
                     when 186..192
                       'Kyrgyzstan'
                     when 192..196
                       'Moldova'
                     when 196..204
                       'Tajikistan'
                     when 204..210
                       'Turkmenistan'
                     when 210..252
                       'Ukraine'
                     when 252..286
                       'Uzbekistan'
                     else
                       'Russia'
                     end

      user.skip_confirmation!
      user.save
    end
  end
end
