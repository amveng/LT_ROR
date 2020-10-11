ActiveAdmin.register Petition do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :topic, :body, :target, :user_id, :status, :answer
  #
  # or
  #
  # permit_params do
  #   permitted = [:topic, :body, :target, :user_id, :status, :answer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
