# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit update]

  def safedelete
    current_user.update_attributes(baned: true)
    current_user.profile.update_attributes(safedelete: DateTime.now)
    reset_session
    redirect_to servers_path, warning: 'Аккаунт успешно удален'
  end 

  def update
    if @profile.update(profile_params)
      flash.now[:success] = 'profile успешно изменён'
      render :edit
    else
      flash.now[:danger] = 'profile не изменён'
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    acces_close unless @profile.user_id == current_user.id
  end

  def profile_params
    params.require(:profile).permit(
      :baner_top_date_start, :baner_top_date_end, :baner_top_img, :baner_top_url
    )    
  end

  def acces_close
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end
end
