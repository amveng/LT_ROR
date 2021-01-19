# frozen_string_literal: true

ActiveAdmin.register ParserSite do
  permit_params :url, :enabled, :css_selector, :number_name, :number_date, :number_rate

  batch_action 'Включить' do |ids|
    batch_action_collection.find(ids).each do |parser|
      parser.update(enabled: true)
    end
    redirect_to collection_path, alert: 'Выбраные парсеры включены.'
  end

  batch_action 'Выключить' do |ids|
    batch_action_collection.find(ids).each do |parser|
      parser.update(enabled: false)
    end
    redirect_to collection_path, alert: 'Выбраные парсеры выключены.'
  end
end
