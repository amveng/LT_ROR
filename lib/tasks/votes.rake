# frozen_string_literal: true

namespace :votes do
  desc 'Тестовая таска для подсчета голосов'
  task calc: :environment do
    puts 'Start task'
    list_id = Server.ids
    list_id.each do |f|
      server = Server.find(f)
      votes_weekly_count = Vote.where(server_id: f, date: 7.days.ago..0.days.ago).count
      votes_days_count = Vote.where(server_id: f, created_at: DateTime.now.yesterday..DateTime.now).count
      votes_weekly_average = votes_weekly_count.to_f / 7
      long_day = ((server.created_at - DateTime.now) / (60 * 60 * 24 * 356)).abs
      votes_weekly_average = 1000 if votes_weekly_average > 1000
      long_day = 0.99 if long_day > 0.99
      rating = 4 - server.status + long_day + votes_weekly_average / 500
      rating += 1 if votes_weekly_average > 10
      rating += 1 if votes_weekly_count > 100
      rating += 1 if votes_days_count > 1000
      rating += 1 if votes_days_count > 3000
      rating = rating.round(2)
      server.update_attributes(rating: rating)
    end 
  end
end
