# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id                    :bigint           not null, primary key
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  safedelete            :datetime
#  ltc                   :decimal(, )      default(0.0)
#  baner_top_date_start  :date
#  baner_top_date_end    :date
#  baner_top_img         :string
#  baner_top_url         :string
#  baner_top_status      :string           default("undefined")
#  baner_menu_date_start :date
#  baner_menu_date_end   :date
#  baner_menu_img        :string
#  baner_menu_url        :string
#  baner_menu_status     :string           default("undefined")
#
class Profile < ApplicationRecord
  belongs_to :user

  before_save :check_update

  mount_uploader :baner_top_img, BanerTopImgUploader

  mount_uploader :baner_menu_img, BanerMenuImgUploader

  validates :baner_top_status, :baner_menu_status, presence: true

  def check_update
    p 'AAAAAAAAAAAAAAAAAA'
    p self.ltc_changed?
    p self.ltc_was
    p self.ltc_change
  end
end
