# frozen_string_literal: true

ActiveAdmin.register Country do
  permit_params :name, :code, :iso3, :numeric, :eu

  index do
    # id_column
    column :name
    column :code
    column :iso3
    column :numeric
    column :eu
    actions
  end

  filter :name
  filter :code
  filter :iso3
  filter :numeric
  filter :eu

  form do |f|
    f.inputs do
      f.input :name
      f.input :code
      f.input :iso3
      f.input :numeric
      f.input :eu
    end
    f.actions
  end
end
