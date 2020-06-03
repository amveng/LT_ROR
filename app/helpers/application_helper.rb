# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error: 'alert-danger',
      info: 'alert-info',
      danger: 'alert-warning',
      alert: 'alert-dark',
      notice: 'alert-primary' }[name.to_sym] || name
  end
end
