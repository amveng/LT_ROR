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
                       'RU'
                     when 146..149
                       'AM'
                     when 149..159
                       'AZ'
                     when 159..169
                       'BY'
                     when 169..186
                       'KZ'
                     when 186..192
                       'KG'
                     when 192..196
                       'MD'
                     when 196..204
                       'TJ'
                     when 204..210
                       'TM'
                     when 210..252
                       'UA'
                     when 252..286
                       'UZ'
                     else
                       Country.where(eu: true).pluck('code').sample
                     end

      user.skip_confirmation!
      user.save
    end
  end
end
