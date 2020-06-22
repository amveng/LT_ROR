# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def info    
    @info = current_user.profile
  end

  def servers
    @servers = current_user.listservers
  end
end
