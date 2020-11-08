# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile,
                only: %i[
                  edit
                  update
                  top15
                  top30
                  publish_top
                  arhiv_top
                  menu15
                  menu30
                  publish_menu
                  arhiv_menu
                ]
  before_action :check_baner_top, only: %i[top15 top30]
  before_action :check_baner_menu, only: %i[menu15 menu30]

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

  def publish_top
    if @profile.update(baner_top_status: 'unverified')
      redirect_to info_profiles_path, info: 'Заявка на публикацию принята в обработку'
    else
      redirect_to info_profiles_path, danger: 'Ошибка при запросе публикации'
    end
  end

  def arhiv_top
    if @profile.update(baner_top_status: 'arhiv')
      redirect_to info_profiles_path, info: 'Банер снят с публикации'
    else
      redirect_to info_profiles_path, danger: 'Ошибка при запросе'
    end
  end

  def top15
    if current_user.profile.ltc >= 50
      ltc_update(-50, @profile.baner_top_url, 'Покупка банера 1920x600 на 15 дней')
      @profile.update(
        baner_top_date_start: Date.today,
        baner_top_date_end: Date.today + 15.days,
        baner_top_status: 'published'
      )
      redirect_to balance_profiles_path, success: 'Банер опубликован'
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def top30
    if current_user.profile.ltc >= 100
      ltc_update(-100, @profile.baner_top_url, 'Покупка банера 1920x600 на 30 дней')
      @profile.update(
        baner_top_date_start: Date.today,
        baner_top_date_end: Date.today + 30.days,
        baner_top_status: 'published'
      )
      redirect_to balance_profiles_path, success: 'Банер опубликован'
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def publish_menu
    if @profile.update(baner_menu_status: 'unverified')
      redirect_to info_profiles_path, info: 'Заявка на публикацию принята в обработку'
    else
      redirect_to info_profiles_path, danger: 'Ошибка при запросе публикации'
    end
  end

  def arhiv_menu
    if @profile.update(baner_menu_status: 'arhiv')
      redirect_to info_profiles_path, info: 'Банер снят с публикации'
    else
      redirect_to info_profiles_path, danger: 'Ошибка при запросе'
    end
  end

  def menu15
    if current_user.profile.ltc >= 30
      ltc_update(-30, @profile.baner_menu_url, 'Покупка банера 240x400 на 15 дней')
      @profile.update(
        baner_menu_date_start: Date.today,
        baner_menu_date_end: Date.today + 15.days,
        baner_menu_status: 'published'
      )
      redirect_to balance_profiles_path, success: 'Банер опубликован'
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def menu30
    if current_user.profile.ltc >= 50
      ltc_update(-50, @profile.baner_menu_url, 'Покупка банера 240x400 на 30 дней')
      @profile.update(
        baner_menu_date_start: Date.today,
        baner_menu_date_end: Date.today + 30.days,
        baner_menu_status: 'published'
      )
      redirect_to balance_profiles_path, success: 'Банер опубликован'
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  def reset_delay
    if current_user.profile.ltc >= 1
      current_user.update(next_votetime: DateTime.now)
      ltc_update(-1, current_user.username, 'Сброс задержки голосования')
      redirect_to server_path(params[:id]),
                  success: "Задержка голосования
       сброшена. Остаток на счете #{current_user.profile.ltc} LTC"
    else
      redirect_to balance_profiles_path, danger: 'Недостаточно средств на счете'
    end
  end

  private

  def ltc_update(ltc, prod, info)
    current_user.profile.update(
      ltc: current_user.profile.ltc + ltc,
      last_product: prod,
      last_description: info
    )
  end

  def set_profile
    @profile = Profile.find(params[:id])
    acces_close unless @profile.user_id == current_user.id
  end

  def profile_params
    params.require(:profile).permit(
      :baner_top_date_start,
      :baner_top_date_end,
      :baner_top_img,
      :baner_top_url,
      :baner_top_status,
      :baner_menu_date_start,
      :baner_menu_date_end,
      :baner_menu_url,
      :baner_menu_status,
      :baner_menu_img
    )
  end

  def check_baner_top
    return if Profile.find_by(baner_top_date_start: ..Date.today, baner_top_date_end: Date.today..).blank?

    redirect_to edit_profile_path(@profile.id), danger: 'Неудалось опубликовать банер'
  end

  def check_baner_menu
    return if Profile.find_by(baner_menu_date_start: ..Date.today, baner_menu_date_end: Date.today..).blank?

    redirect_to edit_profile_path(@profile.id), danger: 'Неудалось опубликовать банер'
  end

  def acces_close
    redirect_to servers_path, danger: 'Доступ запрещен !!!'
  end
end
