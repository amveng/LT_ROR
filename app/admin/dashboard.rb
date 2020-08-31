# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    unless Server.where(publish: 'unverified').blank?
      panel 'Сервера ждущие проверки' do
        table_for Server.where(publish: 'unverified').limit(10) do
          column :title do |server|
            link_to server.title, adm315_server_path(server)
          end
          column :updated_at
          column :publish
          column :user
        end
      end
    end

    unless Server.where(created_at: 7.day.ago..).blank?
      panel 'Новые сервера за последюю неделю' do
        table_for Server.where(created_at: 7.day.ago..).limit(10) do
          column :title do |server|
            link_to server.title, adm315_server_path(server)
          end
          column :created_at
          column :publish
          column :user
        end
        strong { link_to 'Весь список серверов', adm315_servers_path }
      end
    end

    unless Profile.where(baner_top_status: 'unverified').blank?
      panel 'Банеры 1920x600 ждущие проверки' do
        table_for Profile.where(baner_top_status: 'unverified').limit(10) do
          column :profile do |profile|
            link_to image_tag(profile.baner_top_img.url), adm315_profile_path(profile), style: 'width: 200px;'
          end
          column :updated_at
          column :baner_top_status
          column :user
        end
      end
    end

    unless Profile.where(baner_menu_status: 'unverified').blank?
      panel 'Банеры 240x400 ждущие проверки' do
        table_for Profile.where(baner_menu_status: 'unverified').limit(10) do
          column :profile do |profile|
            link_to image_tag(profile.baner_menu_img.url), adm315_profile_path(profile)
          end
          column :updated_at
          column :baner_menu_status
          column :user
        end
      end
    end
  end
end
