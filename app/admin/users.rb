# frozen_string_literal: true
ActiveAdmin.register User do  
  # menu label: 'Пользователи'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # has_many :servers
  permit_params :email, :votetime, :confirmed_at, :locked_at, :provider, :baned, :username

  index do
    selectable_column
    # id_column
    column :email
    column :votetime
    column :profile
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
      f.input :provider, as: :select, collection: User.omniauth_providers
      f.input :baned
      f.input :username
      f.input :locked_at, as: :datepicker
    end
    f.actions
  end
end
