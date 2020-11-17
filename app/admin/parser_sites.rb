# frozen_string_literal: true

ActiveAdmin.register ParserSite do
  permit_params :url, :enabled, :css_selector, :number_name, :number_date, :number_rate
end
