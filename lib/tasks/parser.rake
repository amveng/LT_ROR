# frozen_string_literal: true

namespace :parser do
  desc 'Тестовая таска парсинга серверов'
  # -------------------------------
  # если эта надпись есть значит
  # этот код ужасен лучше не вникать
  #
  # if this inscription is, it means
  # this code is terrible it is better not to delve into
  # -------------------------------
  task server: :environment do
    puts 'Start task'
    nameserver = 'https://new-lineage.ru'
    doc = Nokogiri::HTML(URI.open(nameserver))
    # p doc.title
    tt = 1
    ll = []
    doc.css('li').each do |a|
      if a.content == 'Квест на ушки'
        tt = 0
        next
      end
      next if tt > 0

      # p a.content
      ll << a.content
    end
    0.step(ll.count - 1, 4) do |n|
      version = ll[n].strip
      rate = ll[n + 1].strip
      date = ll[n + 2].strip
      url = ll[n + 3].strip
      next if Server.exists?(urlserver: "https://#{url.downcase}")

      server = Server.new
      user = User.where(provider: 'faker').sample
      serverversion = Serverversion.find_by(name: version)
      server.urlserver = "https://#{url.downcase}"
      server.title = url
      server.user_id = user.id
      server.datestart = date
      server.serverversion_id = serverversion.id if serverversion.present?
      server.rate = (rate.delete '^0-9').to_i
      if server.save
        ParserMessage.where(
          name: nameserver,
          typemsg: 'create',
          body: "#{url} - #{version} - #{rate} - #{date}"
        ).first_or_create
        server.update(publish: 'published')
      else
        ParserMessage.where(
          name: nameserver,
          typemsg: 'error',
          body: "#{url} - #{version} - #{rate} - #{date}"
        ).first_or_create
      end
    end
  end

  task server2: :environment do
    puts 'Start task'
    nameserver = 'https://new-lineage.ru'
    doc = Nokogiri::HTML(URI.open(nameserver))
    p doc.title
    tt = 1
    # ll = []
    doc.css('li').each do |a|
      if a.content == 'Квест на ушки'
        tt = 0
        next
      end
      next if tt > 0

      p a.content
      # ll << a.content
    end
    # 0.step(ll.count - 1, 4) do |n|
    #   version = ll[n].strip
    #   rate = ll[n + 1].strip
    #   date = ll[n + 2].strip
    #   url = ll[n + 3].strip
    #   next if Server.exists?(urlserver: "https://#{url.downcase}")

    #   # p "#{version} #{rate} #{date} #{url}"
    #   server = Server.new
    #   user = User.where(provider: 'faker').sample
    #   serverversion = Serverversion.find_by(name: version)
    #   server.urlserver = "https://#{url.downcase}"
    #   server.title = url
    #   server.user_id = user.id
    #   server.datestart = date
    #   server.serverversion_id = serverversion.id if serverversion.present?
    #   server.rate = (rate.delete '^0-9').to_i
    #   if server.save
    #     ParserMessage.where(
    #       name: nameserver,
    #       typemsg: 'create',
    #       body: "#{url} - #{version} - #{rate} - #{date}"
    #     ).first_or_create
    #     server.update(publish: 'published')
    #   else
    #     ParserMessage.where(
    #       name: nameserver,
    #       typemsg: 'error',
    #       body: "#{url} - #{version} - #{rate} - #{date}"
    #     ).first_or_create
    #   end
    # end
  end
end
