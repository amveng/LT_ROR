# frozen_string_literal: true

ActiveAdmin.register Server do
  permit_params :title,
                :user_id,
                :status_expires,
                :status,
                :urlserver,
                :imageserver,
                :publish,
                :serverversion_id,
                :failed_checks,
                :datestart,
                :description,
                :failed,
                :ip

  config.sort_order = 'created_at_desc'
  config.per_page = [20, 30, 50, 100]
  scope 'premium', :not_normal
  scope 'not_working', :not_working
  scope 'active', :not_arhiv
  scope 'published', :published
  controller do
    def scoped_collection
      super.includes :user
    end
  end

  batch_action 'Опубликовать' do |ids|
    batch_action_collection.find(ids).each do |server|
      server.update(publish: 'published', failed: '')
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
    color_status = {
      top: 'Firebrick',
      vip: 'RoyalBlue',
      normal: 'SlateGrey'
    }
    color_publish = {
      published: 'ForestGreen',
      created: 'RoyalBlue',
      unverified: 'Coral',
      failed: 'Firebrick',
      arhiv: 'SlateGrey'
    }
    selectable_column
    column :title
    column :urlserver do |server|
      link_to server.urlserver, server.urlserver, target: '_blank'
    end
    column :datestart
    column :created_at
    column :publish do |server|
      status_tag(server.publish, style: "font-weight: bold; background-color: #{color_publish[server.publish.to_sym]}")
    end
    column :user
    column :status do |server|
      status_tag(server.status, style: "font-weight: bold; background-color: #{color_status[server.status.to_sym]}")
    end
    actions
  end

  filter :title

  filter :status, as: :select
  filter :datestart
  filter :user
  filter :serverversion
  filter :publish, as: :select
  form do |f|
    f.inputs do
      f.input :title
      f.input :urlserver
      f.input :datestart, as: :datepicker
      f.input :user
      f.input :publish, as: :select
      f.input :failed_checks
      f.input :failed
      f.input :status, as: :select
      f.input :status_expires, as: :datepicker
      f.input :serverversion
      f.input :imageserver
      f.input :description
      f.input :ip
    end
    f.actions
  end
end
