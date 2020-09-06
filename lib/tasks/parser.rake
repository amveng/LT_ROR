# frozen_string_literal: true

namespace :parser do
  desc 'Тестовая таска парсинга серверов'
  task server: :environment do
    puts 'Start task'
    doc = Nokogiri::HTML(URI.open('https://new-lineage.ru'))
    p doc.title
    doc.css('li').each do |a|
      tt = 1 if a.content = '1'
    end
  end
end
