# frozen_string_literal: true

ActiveAdmin.register Profile do
  permit_params :user_id

  index do
    selectable_column
    column :user_id
    column :user
    column :created_at
    column :updated_at
    actions
  end

  filter :user

  form do |f|
    f.inputs do
      f.input :user
    end
    f.actions
  end
end
