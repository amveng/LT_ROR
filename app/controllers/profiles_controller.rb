# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit update top15]
  before_action :check_baner, only: %i[top15]

  def safedelete
    current_user.update_attributes(baned: true)
    current_user.profile.update_attributes(safedelete: DateTime.now)
    reset_session
    redirect_to servers_path, warning: 'Аккаунт успешно удален'
  end

  def show
    redirect_to info_profiles_path
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path, success: 'Профиль успешно изменён'
    else
      flash.now[:danger] = 'Профиль не изменён'
      render :edit
    end
  end

  def top15
    if current_user.profile.ltc >= 50
      current_user.profile.update(ltc: current_user.profile.ltc - 50)
      @profile.update(
        baner_top_date_start: Date.today,
        baner_top_date_end: Date.today + 15.days,
        baner_top_status: 'publish'
      )
      LtcBilling.create(
        user_id: current_user.id,
        amount: -50,
        description: 'Покупка банера 1920x600 на 15 дней',
        product_name: @profile.baner_top_url
      )
      redirect_to balance_profiles_path, success: 'Банер опубликован'
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    acces_close unless @profile.user_id == current_user.id
  end

  def profile_params
    params.require(:profile).permit(
      :baner_top_date_start, :baner_top_date_end, :baner_top_img, :baner_top_url,
      :baner_top_status
    )
  end

  def check_baner
    return if Profile.find_by(baner_top_date_start: ..Date.today, baner_top_date_end: Date.today..).blank?

    redirect_to edit_profile_path(@profile.id), danger: 'Неудалось опубликовать банер'
  end

  def acces_close
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end
end
