# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    recaptcha_valid = verify_recaptcha(action: 'session', minimum_score: 0.8)
    if recaptcha_valid
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "К сожалению гугл считает что вы бот. Пожалуйста, попробуйте еще раз."
      flash.delete :recaptcha_error
      render :new
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
