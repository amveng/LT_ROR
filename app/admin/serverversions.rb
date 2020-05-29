# frozen_string_literal: true

ActiveAdmin.register Serverversion do
  # menu false
  # menu label: 'Хроники'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :hronicle
  #
  # or
  #
  # permit_params do
  #   permitted = [:hronicle]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :hronicle
  index do
    selectable_column
    id_column
    column 'Хроники', :hronicle
    column :created_at
    column :updated_at
    actions
  end

  filter :hronicle
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :hronicle
    end
    f.actions
  end
end
