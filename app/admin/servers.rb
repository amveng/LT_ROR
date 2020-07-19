# frozen_string_literal: true

ActiveAdmin.register Server do
  permit_params :title, :user_id, :status_expires,
                :status, :urlserver, :imageserver,
                :publish, :serverversion_id,
                :datestart, :description, :failed
  scope 'vip', :vip
  controller do
    def scoped_collection
      super.includes :user
    end
  end

  index do
    selectable_column
    # id_column
    column :title
    # column :urlserver
    column :datestart
    # column :status
    column :publish
    # column :serverversion
    column :user
    column :rating
    actions
  end

  filter :title
  # filter :urlserver
  filter :status, as: :select, collection: { TOP: 1, VIP: 2, normal: 3 }
  filter :datestart
  filter :serverversion
  filter :publish, as: :select, collection: %i[create unverified failed published arhiv]
  # filter :user

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlserver
      f.input :datestart
      f.input :user
      f.input :publish, as: :select, collection: %i[create unverified failed published arhiv]
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
