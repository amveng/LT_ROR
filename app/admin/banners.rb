# frozen_string_literal: true

ActiveAdmin.register Banner do
  permit_params :publish,
                :position,
                :banner_image,
                :date_start,
                :date_end,
                :user_id,
                :server_id

  form do |f|
    f.inputs do
      f.input :publish, as: :select
      f.input :position, as: :select
      f.input :banner_image
      f.input :date_start, as: :datepicker
      f.input :date_end, as: :datepicker
      f.input :user
      f.input :server, as: :select, collection: Server.where(user_id: banner.user_id)
    end
    f.actions
  end
end
