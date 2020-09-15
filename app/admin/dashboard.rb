# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Ручной запуск воркеров' do
          div do
            render('/admin/worker_panel')
          end
        end
      end
    end

    unless Server.where(publish: 'unverified').blank?
      panel 'Сервера ждущие проверки' do
        table_for Server.where(publish: 'unverified').limit(10) do
          column :title do |server|
            link_to server.title, adm315_server_path(server)
          end
          column :updated_at
          column :publish do |server|
            status_tag(server.publish, style: 'font-weight: bold; background-color: Coral')
          end
          column :user
        end
      end
    end

    unless Server.where(created_at: 7.day.ago..).blank?
      panel 'Новые сервера за последюю неделю' do
        table_for Server.where(created_at: 7.day.ago..).order(created_at: :desc).limit(20) do
          column :title do |server|
            link_to server.title, adm315_server_path(server)
          end
          column :created_at do |server|
            case server.created_at
            when Date.today..Date.tomorrow
              'Сегодня'
            when Date.yesterday..Date.today
              'Вчера'
            else
              server.created_at
            end
          end
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
        end
        strong { link_to 'Весь список серверов', adm315_servers_path, style: 'font-size: 16px;' }
      end
    end

    unless User.where(created_at: 7.day.ago..).blank?
      panel 'Новые пользователи за последюю неделю' do
        table_for User.where(created_at: 7.day.ago..).limit(20) do
          column :username do |user|
            link_to user.username, adm315_user_path(user)
          end
          column :country do |user|
            if Country.exists?(code: user.country)
              Country.find_by(code: user.country).name
            else
              'Неопределено'
            end
          end
          column :created_at do |user|
            case user.created_at
            when 1.days.ago...0.days.ago
              'Сегодня'
            when 2.days.ago..1.days.ago
              'Вчера'
            else
              user.created_at
            end
          end
        end
        strong { link_to 'Весь список пользователей', adm315_users_path, style: 'font-size: 16px;' }
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
