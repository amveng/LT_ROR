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
  # has_many :listservers
  permit_params :email, :password, :password_confirmation, :locked_at, :baned

  index do
    selectable_column
    # id_column
    column :email
    # column 'БТ', :locked_at
    # column :baned
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :created_at
  filter :updated_at
  filter :baned
  # filter :locked_at

  form do |f|
    f.inputs do
      f.input :email      
      # f.input :password
      # f.input :password_confirmation
      f.input :baned
      # f.input :locked_at, as: :datepicker
    end
    f.actions
  end
end
