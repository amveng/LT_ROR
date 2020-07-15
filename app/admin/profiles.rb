# frozen_string_literal: true

ActiveAdmin.register Profile do
  belongs_to :user
  permit_params :user_id, :ltc

  controller do
    def scoped_collection
      super.includes :user
    end
  end

  index do
    selectable_column
    # column :user_id
    column :user
    column :ltc
    column :created_at
    column :updated_at
    actions
  end

  filter :user
  filter :ltc
  filter :safedelete

  form do |f|
    f.inputs do      
      f.input :ltc
    end
    f.actions
  end
end
