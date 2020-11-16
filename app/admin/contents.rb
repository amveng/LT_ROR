# frozen_string_literal: true

ActiveAdmin.register Content do
  permit_params :name, :body, :header, :menu, :menu_publish, :id, :navbar_publish

  index do
    id_column
    column :name
    column :header
    column :menu
    column :menu_publish
    column :navbar_publish
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :header
  filter :menu
  filter :menu_publish
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :id
      f.input :name
      f.input :header
      f.input :menu
      f.input :menu_publish
      f.input :navbar_publish
      f.input :body
    end
    f.actions
  end
end
