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
    def maindef
      @count_complite = 0
      @servlist = %w[
        https://new-lineage.ru
        https://l2-pick.ru
        https://l2oops.com
        https://l2-top.ru
      ]

      0.step(3, 1) do |s|
        @nameserver = @servlist[s]
        begin
          @uri = URI.open(@nameserver)
        rescue StandardError
          urierror
        else
          case s
          when 0
            parsserver0
          when 1
            parsserver1
          when 2
            parsserver2
          when 3
            parsserver3
          end
          @count_complite += 1
        end
      end
      complite
    end
    #----------------------------------

    def create_server
      @server = Server.new
      @user = User.where(provider: 'faker').sample
      @serverversion = Serverversion.find_by(name: @version)
      @server.urlserver = "https://#{@url.downcase}"
      @server.title = @url
      @server.user_id = @user.id
      @server.datestart = @date
      @server.serverversion_id = @serverversion.id if @serverversion.present?
      @server.rate = (@rate.delete '^0-9').to_i
      if @server.save
        ParserMessage.where(
          name: @nameserver,
          typemsg: 'create',
          body: "#{@url} - #{@version} - #{@rate} - #{@date}"
        ).first_or_create
        @server.update(publish: 'published')
      else
        # p @server
        ParserMessage.where(
          name: @nameserver,
          typemsg: 'error',
          body: "#{@url} - #{@version} - #{@rate} - #{@date}"
        ).first_or_create
      end
      # p "#{@url} - #{@version} - #{@rate} - #{@date}"
    end

    def urierror
      ParserMessage.create(
        name: @nameserver,
        typemsg: 'no server',
        body: 'Сервер недоступен'
      )
    end

    def complite
      ParserMessage.create(
        name: 'Парсинг',
        typemsg: 'complite',
        body: "Серверов обработано - #{@count_complite}"
      )
    end

    def striper
      @date = Date.tomorrow.to_s if @date.upcase == 'ЗАВТРА'
      @date = Date.today.to_s if @date.upcase == 'СЕГОДНЯ'
      @date = Date.yesterday.to_s if @date.upcase == 'ВЧЕРА'
      @date = "#{@date[0, 6]}20#{@date[6, 2]}" if @date.length == 8
      @version = 'Interlude +' if @version == 'Interlude+'
      @version = 'High Five +' if @version == 'High Five+'
    end

    def parsserver0
      doc = Nokogiri::HTML(@uri)
      tt = 1
      @ll = []
      doc.css('li').each do |a|
        if a.content == 'Квест на ушки'
          tt = 0
          next
        end
        next if tt > 0

        @ll << a.content
      end
      0.step(@ll.count - 1, 4) do |n|
        @version = @ll[n].strip
        @rate = @ll[n + 1].strip
        @date = @ll[n + 2].strip
        @url = @ll[n + 3].strip
        striper
        next if Server.exists?(urlserver: "https://#{@url.downcase}")

        create_server
      end
    end

    def parsserver1
      doc = Nokogiri::HTML(@uri)
      @ll = []
      doc.css('div').each do |a|
        @ll << a.content
      end
      0.step(@ll.count - 5, 1) do |n|
        next unless @ll[n] == ''

        @url = @ll[n + 1].strip
        @rate = @ll[n + 2].strip
        @version = @ll[n + 3].strip
        @date = @ll[n + 4].strip
        striper
        next if @url.length > 42
        next if @rate.length > 10
        next if @version.length > 33
        next if @date.length > 16
        next if Server.exists?(urlserver: "https://#{@url.downcase}")

        create_server
      end
    end

    def parsserver2
      doc = Nokogiri::HTML(@uri)

      @ll = []
      doc.css('li').each do |a|
        next if a == ''

        @ll << a.content
      end
      0.step(@ll.count - 15, 9) do |n|
        @url = @ll[n + 2].strip
        @rate = @ll[n + 3].strip
        @version = @ll[n + 4].strip
        @date = @ll[n].strip
        striper
        next if @url.length > 42
        next if @rate.length > 10
        next if @version.length > 33
        next if @date.length > 16
        next if Server.exists?(urlserver: "https://#{@url.downcase}")

        create_server
      end
    end

    def parsserver3
      doc = Nokogiri::HTML(@uri)
      @ll = []
      doc.css('div').each do |a|
        @ll << a.content
      end
      0.step(@ll.count - 8, 1) do |n|
        next unless @ll[n] == '•'

        @url = @ll[n + 1].strip
        @rate = @ll[n + 3].strip
        @version = @ll[n + 4].strip
        @date = @ll[n + 5].strip
        striper
        next if @url.length > 42
        next if @rate.length > 10
        next if @version.length > 33
        next if @date.length > 16
        next if Server.exists?(urlserver: "https://#{@url.downcase}")

        create_server
      end
    end

    maindef
  end
end
