# frozen_string_literal: true

ActiveAdmin.register LtcBilling do
  permit_params :user_id, :amount, :description, :product_name

  index do
    selectable_column
    column :user
    column :amount
    column :description
    column :product_name
    column :created_at
    actions
  end

  filter :user
  filter :amount
  filter :description
  filter :product_name
  filter :created_at
end
