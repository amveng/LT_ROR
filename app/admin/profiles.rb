# frozen_string_literal: true

ActiveAdmin.register Profile do
  # belongs_to :user

  permit_params :user_id, :ltc,
                :baner_top_date_start, :baner_top_status,
                :baner_top_date_end, :baner_top_img, :baner_top_url

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
      f.input :user_id
      f.input :baner_top_date_start, as: :datepicker
      f.input :baner_top_date_end, as: :datepicker
      f.input :baner_top_img
      f.input :baner_top_url, as: :select, collection: Server.where(user_id: profile.user_id).pluck('urlserver')
      f.input :baner_top_status
    end
    f.actions
  end
end
