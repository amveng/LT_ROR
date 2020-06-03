# frozen_string_literal: true

ActiveAdmin.register Listserver do
  # menu false
  # menu label: 'Сервера'
  # belongs_to :serverversion
  # belongs_to :user

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :urlServer, :dateStart, :rating, :publish
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :urlServer, :dateStart, :rating, :publish]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
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
    column :user_id
    actions
  end

  filter :title
  filter :urlServer
  filter :dateStart
  filter :version, as: :select, collection: Serverversion.pluck('hronicle')
  filter :publish

  form do |f|
    f.inputs do
      f.input :title
      f.input :urlServer
      f.input :dateStart, as: :datepicker,
      datepicker_options: {
        min_date: 5.years.ago.to_date,
        max_date: "+3M +1D"
      }
      f.input :user_id
      f.input :publish
      f.input :status, as: :select, collection: %i[normal VIP TOP]
      f.input :version, as: :select, collection: Serverversion.pluck('hronicle')
    end
    f.actions
  end
end
