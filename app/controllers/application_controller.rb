# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  # protect_from_forgery with: :null_session
  add_flash_types :success, :danger, :info, :warning
  # before_action :set_user_servers

  # rescue_from ActiveRecord::RecordNotFound do |_exception|
  #   redirect_to root_path, alert: 'Record not found'
  # end
end
