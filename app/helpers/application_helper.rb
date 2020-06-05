# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error: 'alert-danger',
      info: 'alert-info',
      danger: 'alert-danger',
      warning: 'alert-warning',
      alert: 'alert-danger',
      notice: 'alert-primary' }[name.to_sym] || name
  end

  def acces_new_server?
    !@listservers_user.pluck('publish').include? false
  end
end
