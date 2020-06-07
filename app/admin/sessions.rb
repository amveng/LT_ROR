ActiveAdmin.register Session do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :session_id, :data
  #
  # or
  #
  # permit_params do
  #   permitted = [:session_id, :data]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    # id_column
    column :session_id
    # column 'БТ', :locked_at
    column :data
    column :created_at
    column :updated_at
    actions
  end

  filter :session_id
  filter :created_at
  filter :updated_at
  filter :data
  # filter :locked_at

  form do |f|
    f.inputs do
      # f.input :email      
      # f.input :password
      # f.input :password_confirmation
      # f.input :baned
      # f.input :locked_at, as: :datepicker
    end
    f.actions
  end  
end
