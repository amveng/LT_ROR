# frozen_string_literal: true

ActiveAdmin.register Profile do
  permit_params :user_id

  index do
    selectable_column
    # column :user_id
    column :user
    column :created_at
    column :updated_at
    actions
  end

  filter :user
  filter :safedelete


  form do |f|
    f.inputs do
      f.input :user
      f.input :safedelete, as: :datepicker
    end
    f.actions
  end
end
