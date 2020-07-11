ActiveAdmin.register LtcBilling do

  permit_params :server_id, :user_id, :date

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
 

  form do |f|
    f.inputs do
      # f.input :user
      # f.input :server
      # f.input :date, as: :datepicker
    end
    f.actions
  end
end
