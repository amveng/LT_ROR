# frozen_string_literal: true

ActiveAdmin.register Server do
  permit_params :title, :user_id, :status_expires,
                :status, :urlserver, :imageserver,
                :publish, :serverversion_id, :failed_checks,
                :datestart, :description, :failed
  scope 'premium', :premium
  scope 'not_working', :not_working
  controller do
    def scoped_collection
      super.includes :user
    end
  end

  index do
    selectable_column
    column :title
    column :datestart
    column :publish
    column :user
    column :rating
    actions
  end

  filter :title

  filter :status, as: :select, collection: { TOP: 1, VIP: 2, normal: 3 }
  filter :datestart
  filter :serverversion
  filter :publish, as: :select, collection: %i[
    create unverified failed published arhiv
  ]

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlserver
      f.input :datestart, as: :datepicker
      f.input :user
      f.input :publish, as: :select, collection: %i[
        create unverified failed published arhiv
      ]
      f.input :failed_checks
      f.input :failed
      f.input :status, as: :select, collection: { TOP: 1, VIP: 2, normal: 3 }
      f.input :status_expires, as: :datepicker
      f.input :serverversion
      f.input :imageserver
      f.input :description
    end
    f.actions
  end
end
