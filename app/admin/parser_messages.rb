# frozen_string_literal: true

ActiveAdmin.register ParserMessage do
  permit_params :name, :typemsg, :body

  index do
    selectable_column
    column :name
    column :typemsg
    column :body
    column :created_at
    actions
  end

  filter :name
  filter :typemsg
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :typemsg
      f.input :body
    end
    f.actions
  end
end
