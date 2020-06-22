class ProfilesController < ApplicationController



  def info
    @info = Profile.find(current_user.id)
  end





end
