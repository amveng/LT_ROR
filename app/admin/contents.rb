ActiveAdmin.register Content do
  permit_params :name, :body, :header, :subheader

  index do
    column :name
    column :header
    column :subheader
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :header
  filter :subheader
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :header
      f.input :subheader
      f.input :body
    end
    f.actions
  end

end
