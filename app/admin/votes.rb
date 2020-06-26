ActiveAdmin.register Vote do
  
  permit_params :server_id, :user_id, :date

  index do
    selectable_column
    column :user
    column :server
    column :date
    actions
  end


  filter :user
  filter :server
  filter :date

  form do |f|
    f.inputs do
      f.input :user
      f.input :server
      f.input :date, as: :datepicker
    end
    f.actions
  end

end
