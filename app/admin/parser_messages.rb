# frozen_string_literal: true

ActiveAdmin.register ParserMessage do
  permit_params :name, :typemsg, :body, :date

  index do
    selectable_column
    column :name
    column :typemsg
    column :body
    column :date
    column :created_at
    actions
  end

  filter :name, as: :select, collection: ParserMessage.pluck('name').uniq
  filter :typemsg, as: :check_boxes, collection: ParserMessage.pluck('typemsg').uniq
  filter :body
  filter :date
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :typemsg
      f.input :body
      f.input :date, as: :datepicker
    end
    f.actions
  end
end
