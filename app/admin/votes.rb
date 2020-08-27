ActiveAdmin.register Vote do
  
  permit_params :server_id, :user_id, :date, :country

  index do
    selectable_column
    column :user
    column :server
    column :date
    column :country
    actions
  end


  filter :user
  filter :server
  filter :date
  filter :country

  form do |f|
    f.inputs do
      f.input :user
      f.input :server
      f.input :country, as: :string
      f.input :date, as: :datepicker
    end
    f.actions
  end

end
