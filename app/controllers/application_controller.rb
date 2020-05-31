# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true
  add_flash_types :success, :danger, :info, :warning
  before_action :set_user_servers

  # def after_sign_in_path_for(_resource)
  #   redirect_to request.referer
  # end
 
  private

  def set_user_servers
    @listservers_user = current_user.listservers if user_signed_in?
  end
end
