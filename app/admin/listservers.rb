# frozen_string_literal: true

ActiveAdmin.register Listserver do
  permit_params :title, :user_id,
                :status, :urlserver,
                :publish, :serverversion_id,
                :datestart
  # scope 'Неактивные', :unpublish
  index do
    selectable_column
    # id_column
    column :title
    # column :urlserver
    column :datestart
    # column :status
    # column :publish
    column :serverversion
    column :user
    column :rating
    actions
  end

  filter :title
  # filter :urlserver
  filter :status
  filter :datestart
  filter :serverversion
  filter :publish
  # filter :user

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlserver
      f.input :datestart
      f.input :user
      f.input :publish
      f.input :status
      f.input :serverversion
    end
    f.actions
  end
end
