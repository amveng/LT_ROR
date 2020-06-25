# frozen_string_literal: true

namespace :votes do
  desc 'Тестовая таска для подсчета голосов'
  task calc: :environment do
    # puts 'Start task'
    # list_id = Listserver.ids
    # list_id.each do |f|
    #   server = Listserver.find(f)
    #   votes_weekly_count = Vote.where(listserver_id: f, date: 7.days.ago..0.days.ago).count
    #   votes_weekly_average = votes_weekly_count.to_f / 7
    #   rating = 4 - server.status

    #   print "#{f} - v w c: #{votes_weekly_count} | "
    #   print " v w a: #{votes_weekly_average} | "
    #   rating += 1 if votes_weekly_average > 1
    #   rating += 1 if votes_weekly_count > 2
    #   rating += if votes_weekly_average > 10
    #               2
    #             else
    #               votes_weekly_average / 10 * 2
    #             end
    #   rating = rating.round(2)
    #   print " v s s: #{rating}"

    #   puts ''
    #   server.rating = rating
    #   server.save
    # end
    a = Date.today
    1000.times do
      Vote.create(user_id: 3, listserver_id: 2, date: a)
    end
  end
end
