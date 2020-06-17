ActiveAdmin.register Vote do
  
  permit_params :listserver_id, :user_id, :date

  index do
    selectable_column
    column 'Пользователь', :user
    column 'Сервер', :listserver
    column 'Дата голосования', :date
    actions
  end


  filter :user
  filter :listserver
  filter :date

  form do |f|
    f.inputs do
      f.input :user
      f.input :listserver
      f.input :date, as: :datepicker
    end
    f.actions
  end

end
