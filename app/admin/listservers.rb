# frozen_string_literal: true

ActiveAdmin.register Listserver do
  permit_params :title, :user_id,
                :status, :urlServer,
                :publish, :version,
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
    column :version
    column :user
    column :rating
    actions
  end

  filter :title
  filter :urlServer
  filter :dateStart
  filter :version, as: :select, collection: Serverversion.pluck('hronicle')
  filter :publish
  # filter :user

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlServer
      f.input :dateStart, as: :datepicker,
      datepicker_options: {
        min_date: 5.years.ago.to_date,
        max_date: "+3M +1D"
      }
      f.input :user
      f.input :publish
      f.input :status, as: :select, collection: %i[normal VIP TOP]
      f.input :version, as: :select, collection: Serverversion.pluck('hronicle')
    end
    f.actions
  end
end
