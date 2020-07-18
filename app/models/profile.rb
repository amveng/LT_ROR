class Profile < ApplicationRecord
  belongs_to :user  

  mount_uploader :baner_top_img, BanerTopImgUploader

  validates :baner_top_img, :baner_top_url, presence: true
end
