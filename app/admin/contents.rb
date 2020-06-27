ActiveAdmin.register Content do
  permit_params :title, :body, :header, :subheader

  index do
    selectable_column
    column :title
    column :header
    column :subheader    
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :header
  filter :subheader
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :header
      f.input :subheader
      f.input :body
    end
    f.actions
  end

end
