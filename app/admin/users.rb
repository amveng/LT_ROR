# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :votetime, :confirmed_at, :locked_at, :provider,
                :baned, :username, profile_attributes: :ltc

  controller do
    def scoped_collection
      super.includes :servers, :profile
    end
  end

  show do
    attributes_table do
      row :username
      row :email
      row :provider
      row :ltc do |profile|
        profile.profile.ltc
      end      
      row :uid
      row :baned
      row :unconfirmed_email
      row :created_at
      row :updated_at
      row :servers
      row :last_sign_in_ip
      row :last_sign_in_at
      row :current_sign_in_ip
      row :current_sign_in_at
      row :sign_in_count
      row :votetime
      row :remember_created_at
      row :safedelete do |profile|
        profile.profile.safedelete
      end
    end
  end

  index do
    selectable_column
    column :email
    column :ltc do |profile|
      profile.profile.ltc
    end
    column :username
    column :provider
    column :servers

    actions
  end

  filter :email
  filter :username
  filter :created_at
  filter :updated_at
  filter :votetime
  filter :baned
  filter :provider, as: :select, collection: User.omniauth_providers

  form do |f|
    f.inputs do
      f.input :email
      f.input :votetime, as: :string
      f.input :baned
      f.input :username
      f.input :locked_at, as: :datepicker
      f.input :confirmed_at, as: :datepicker
    end
    f.inputs profile: 'Профиль', for: :profile do |profile|
      profile.input :ltc
    end
    f.actions
  end
end
