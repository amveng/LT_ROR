# frozen_string_literal: true

class ParserSiteWorker
  include Sidekiq::Worker

  def perform
    search_patterns = Serverversion.pluck(:name)
    sites = ParserSite.where(enabled: true)
    sites.each do |site|
      parse_site(site, search_patterns)
    end
  end

  def parse_site(site, search_patterns)
    document = Services::ParserEngine::SiteGraber.new(site.url).take
    return if document.blank?

    selected_data = Services::ParserEngine::DataSelector.new(document, site.css_selector).selected
    match_numbers = Services::ParserEngine::SearchByPatterns.new(selected_data, search_patterns).collect_array
    array_of_new_servers = Services::ParserEngine::ServersBuilder.new(match_numbers, selected_data, site).make
    Services::ParserEngine::SaveServers.new(array_of_new_servers, site.url).finishing_touch
  end
end
