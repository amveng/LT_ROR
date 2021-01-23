# frozen_string_literal: true

class BannersController < ApplicationController
  before_action :authenticate_user!
  before_action :banner_belong_user, only: %i[edit update destroy show]

  def index
    @banners = current_user.banners.includes(:server).order(updated_at: :desc)
  end

  def show
    redirect_to banners_path unless @banner.created?
    @payment = Services::BannerOperations::CalculationOfBannerPayment.new(
      @banner.date_start, @banner.date_end, @banner.position
    ).calculate
  end

  def new
    if current_user.banners.created.count > 3
      redirect_to banners_path, danger: 'Вы достигли лимита неопубликованных баннеров'
    end
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.user_id = current_user.id
    @banner.save!
    redirect_to banners_path, success: 'Баннер успешно создан.'
  rescue StandardError
    flash.now[:danger] = 'Баннер не создан'
    render :new
  end

  def edit
    redirect_to banners_path unless @banner.created?
  end

  def update
    @banner.update!(banner_params)
    redirect_to banners_path, success: 'Баннер успешно изменён'
  rescue StandardError
    flash.now[:danger] = 'Баннер не изменён'
    render :edit
  end

  def destroy
    @banner.destroy
    redirect_to banners_path, info: 'Баннер успешно удален'
  end

  private

  def banner_belong_user
    set_banner
    acces_close unless @banner.user_id == current_user.id
  end

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def acces_close
    redirect_to banners_path, danger: 'Доступ запрещен !!!'
  end

  def banner_params
    params.require(:banner).permit(
      :position,
      :banner_image,
      :date_start,
      :date_end,
      :server_id
    )
  end
end
