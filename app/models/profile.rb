# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  before_save :create_billing_for_update_ltc

  mount_uploader :baner_top_img, BanerTopImgUploader

  mount_uploader :baner_menu_img, BanerMenuImgUploader

  validates :baner_top_status, :baner_menu_status, presence: true

  private

  def create_billing_for_update_ltc
    profile = self
    return unless profile.ltc_changed?

    profile.last_product = profile.last_product || 'Admin'
    LtcBilling.create(
      amount: profile.ltc_change.reduce(:-) * -1,
      user_id: profile.user_id,
      product_name: profile.last_product,
      description: profile.last_description
    )
    profile.last_product = nil
    profile.last_description = nil
  end
end
