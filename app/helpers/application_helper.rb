# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-danger',
      notice: 'alert-primary' }[name.to_sym] || name
  end
end
