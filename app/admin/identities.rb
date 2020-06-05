ActiveAdmin.register Identity do
  menu label: 'omniauth'
  # permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :created_at
    column :user_id
    column :provider
    column :uid
    actions
  end

  filter :user_id
  filter :provider
  filter :uid
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user_id
      # f.input :password
      # f.input :password_confirmation
    end
    f.actions
  end
end
