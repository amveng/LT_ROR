# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email,
                :next_votetime,
                :confirmed_at,
                :locked_at,
                :provider,
                :baned,
                :current_sign_in_ip,
                :country,
                :username,
                profile_attributes: :ltc

  scope 'Только настоящие', :nofaker

  controller do
    def scoped_collection
      super.includes :servers, :profile
    end
  end

  batch_action 'Забанить' do |ids|
    batch_action_collection.find(ids).each do |user|
      user.update(baned: true)
    end
    redirect_to collection_path, alert: 'The posts have been flagged.'
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
      row :profile
      row :country
      row :last_sign_in_ip
      row :last_sign_in_at
      row :current_sign_in_ip
      row :current_sign_in_at
      row :sign_in_count
      row :next_votetime
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
    column :country
    column :servers
    actions
  end

  filter :email
  filter :username
  filter :country, as: :select
  filter :created_at
  filter :updated_at
  filter :next_votetime
  filter :baned
  filter :provider, as: :select

  form do |f|
    f.inputs do
      f.input :email
      f.input :next_votetime, as: :string
      f.input :country, as: :string
      f.input :baned
      f.input :username
      f.input :locked_at, as: :datepicker
      f.input :confirmed_at, as: :datepicker
      f.input :current_sign_in_ip, as: :string
    end
    f.actions
  end
end
