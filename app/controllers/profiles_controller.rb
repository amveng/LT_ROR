# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def info
    @info = current_user.profile
  end

  def servers
    @servers = current_user.servers.includes(:serverversion)
  end

  def safedelete
    current_user.update_attributes(baned: true)
    current_user.profile.update_attributes(safedelete: DateTime.now)
    reset_session
    redirect_to servers_path, warning: 'Аккаунт успешно удален'
  end
end
