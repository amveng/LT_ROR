# frozen_string_literal: true

class ParserSiteWorker
  include Sidekiq::Worker

  def perform
    search_data = Serverversion.pluck(:name)
    sites = ParserSite.where(enabled: true)
    sites.each do |site|
      document = data_site(site.url)
      content = parsing(document, site.css_selector)
      field_numbers = data_analysis(content, search_data)
      servers = data_validation(field_numbers, content, site)
      p servers
      create_servers(servers)
    end
  end

  def data_site(url)
    Nokogiri::HTML(URI.open(url))
  rescue StandardError
    ParserMessage.create(
      name: url,
      typemsg: 'no server',
      body: 'Сервер недоступен'
    )
  end

  def parsing(document, css_selector)
    content = []
    document.css(css_selector).each do |selector|
      content << selector.content.strip
    end
    content
  end

  def data_analysis(content, search_data)
    found_field_numbers = []
    content.each_with_index do |data, index|
      found_field_numbers << index if search_data.include? data
    end
    found_field_numbers
  end

  def data_validation(field_numbers, content, site)
    servers = []
    field_numbers.each do |index|
      serverversion = normalized_serverversion(content[index])
      rate = normalized_rate(content[index + site.number_rate])
      date = normalized_date(content[index + site.number_date])
      title = content[index + site.number_name]
      server = Server.new(
        serverversion: Serverversion.find_by(name: serverversion),
        rate: rate,
        datestart: date,
        title: title,
        urlserver: "https://#{title}"
      )
      servers << server if server.valid?
    end
    servers
  end

  def normalized_date(date)
    date = "#{date[0, 6]}20#{date[6, 2]}" if date.length == 8
    date
  end

  def normalized_rate(rate)
    rate = rate.delete '^0-9'
    rate.blank? ? 0 : Integer(rate, 10)
  end

  def normalized_serverversion(version)
    version = 'Interlude +' if version == 'Interlude+'
    version = 'High Five +' if version == 'High Five+'
    version
  end

  def create_servers(servers)
    servers.each(&:save)
  end
end
