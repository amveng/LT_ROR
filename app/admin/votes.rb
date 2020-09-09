# frozen_string_literal: true

ActiveAdmin.register Vote do
  permit_params :server_id, :user_id, :date, :country, :confirmation

  index do
    selectable_column
    column :user
    column :server
    column :created_at
    column :country
    column :confirmation
    actions
  end

  filter :user
  filter :server
  filter :created_at
  filter :country

  form do |f|
    f.inputs do
      f.input :user
      f.input :server
      f.input :country, as: :string
      f.input :date, as: :datepicker
      f.input :confirmation
    end
    f.actions
  end
end
