ActiveAdmin.register Listserver do
  # menu false
  menu label: 'Сервера'  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :urlServer, :dateStart, :rating, :publish
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :urlServer, :dateStart, :rating, :publish]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :urlServer, :dateStart, :publish

  index do
    selectable_column
    # id_column
    column :title
    column :urlServer
    column :dateStart
    # column :rating
    column :publish
    column :serverversions_id
    # column :updated_at
    actions
  end

  filter :title
  filter :urlServer
  filter :dateStart
  # filter :created_at
  filter :publish

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlServer
      f.input :dateStart
      f.input :publish
      f.input :serverversions_id
    end
    f.actions
  end

  
end
