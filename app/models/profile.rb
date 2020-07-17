class Profile < ApplicationRecord
  belongs_to :user  

  mount_uploader :baner_top_img, BanerTopImgUploader
end
