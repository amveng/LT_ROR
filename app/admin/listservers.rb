# frozen_string_literal: true

ActiveAdmin.register Listserver do
  permit_params :title, :user_id,
                :status, :urlServer,
                :publish, :serverversion_id,
                :dateStart
  # scope 'Неактивные', :unpublish
  index do
    selectable_column
    # id_column
    column :title
    column :urlServer
    column :dateStart
    column :status
    column :publish
    column :serverversion
    column :user
    column :rating
    actions
  end

  filter :title
  filter :urlServer
  filter :dateStart
  filter :serverversion
  filter :publish
  # filter :user

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlServer
      f.input :dateStart, as: :datepicker
      f.input :user
      f.input :publish
      f.input :status, as: :select, collection: %i[normal VIP TOP]
      f.input :serverversion
    end
    f.actions
  end
end
