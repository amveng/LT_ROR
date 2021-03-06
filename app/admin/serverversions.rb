# frozen_string_literal: true

ActiveAdmin.register Serverversion do
  permit_params :name
  index do
    column :name
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
