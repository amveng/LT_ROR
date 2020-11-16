# frozen_string_literal: true

ActiveAdmin.register ParserSite do
  permit_params :url, :enabled
end
