# frozen_string_literal: true

class OmniauthController < ApplicationController
  before_action :all_in, except: %i[failure]

  def vkontakte; end

  def github; end

  def google_oauth2; end

  def facebook; end

  def failure
    flash[:error] = 'При входе произошла ошибка. Пожалуйста, зарегистрируйтесь или попробуйте войти позже.'
    redirect_to new_user_registration_url
  end

  private

  def all_in
    if user_signed_in?
      flash[:info] = 'Вы уже вощли в систему.'
      return redirect_to servers_path 
    end
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      CountryWorker.perform_async(@user.id)
      sign_in_and_redirect @user
    else
      flash[:error] = 'При входе через сервис произошла ошибка. Пожалуйста, зарегистрируйтесь или попробуйте другой способ.'
      redirect_to new_user_registration_url
    end
  end
end
