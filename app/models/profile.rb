# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :baner_top_img, BanerTopImgUploader

  mount_uploader :baner_menu_img, BanerMenuImgUploader

  validates :baner_top_status, :baner_menu_status, presence: true
end
