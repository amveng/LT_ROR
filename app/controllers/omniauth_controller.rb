# frozen_string_literal: true

class OmniauthController < ApplicationController
  def vkontakte
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else      
      flash[:error] = 'There was a problem signing you in through Vkontakte. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'При входе произошла ошибка. Пожалуйста, зарегистрируйтесь или попробуйте войти позже.'
    redirect_to new_user_registration_url
  end
end