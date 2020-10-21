# frozen_string_literal: true

ActiveAdmin.register Server do
  permit_params :title, :user_id, :status_expires,
                :status, :urlserver, :imageserver,
                :publish, :serverversion_id, :failed_checks,
                :datestart, :description, :failed, :ip

  config.sort_order = 'created_at_desc'
  config.per_page = [20, 30, 50, 100]
  scope 'premium', :premium
  scope 'not_working', :not_working
  scope 'active', :active
  scope 'published', :published
  controller do
    def scoped_collection
      super.includes :user
    end
  end

  batch_action 'Опубликовать' do |ids|
    batch_action_collection.find(ids).each do |server|
      server.update(publish: 'published')
    end
    redirect_to collection_path, alert: 'Выбраные сервера опубликованы.'
  end

  batch_action 'Выключить' do |ids|
    batch_action_collection.find(ids).each do |server|
      server.update(publish: 'failed', failed: 'Выключено администрацией')
    end
    redirect_to collection_path, alert: 'Выбраные сервера Выключены.'
  end

  index do
    selectable_column
    column :title
    column :urlserver do |server|
      link_to server.urlserver, server.urlserver, target: '_blank'
    end
    column :datestart
    column :created_at
    column :publish do |server|
      color = case server.publish
              when 'published'
                'ForestGreen'
              when 'create'
                'RoyalBlue'
              when 'unverified'
                'Coral'
              when 'failed'
                'Firebrick'
              when 'arhiv'
                'SlateGrey'
              else
                'dark'
              end

      status_tag(server.publish, style: "font-weight: bold; background-color: #{color}")
    end
    column :user
    column :status do |server|
      status = case server.status
               when 1
                 %w[TOP Firebrick]
               when 2
                 %w[VIP RoyalBlue]
               when 3
                 %w[poor LightGray]
               end

      status_tag(status[0], style: "font-weight: bold; background-color: #{status[1]}")
    end
    actions
  end

  filter :title

  filter :status, as: :select, collection: { TOP: 1, VIP: 2, normal: 3 }
  filter :datestart
  filter :user
  filter :serverversion
  filter :publish, as: :select, collection: %i[
    create unverified failed published arhiv
  ]

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlserver
      f.input :datestart, as: :datepicker
      f.input :user
      f.input :publish, as: :select, collection: %i[
        create unverified failed published arhiv
      ]
      f.input :failed_checks
      f.input :failed
      f.input :status, as: :select, collection: { TOP: 1, VIP: 2, normal: 3 }
      f.input :status_expires, as: :datepicker
      f.input :serverversion
      f.input :imageserver
      f.input :description
      f.input :ip
    end
    f.actions
  end
end
