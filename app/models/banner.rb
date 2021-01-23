# frozen_string_literal: true

class Banner < ApplicationRecord
  belongs_to :server
  belongs_to :user

  mount_uploader :banner_image, BannerUploader

  enum publish: { created: 0, paid: 1, banned_from_showing: 2, published: 3, unverified: 4, finished: 5 }
  enum position: {
    top: 0,
    menu: 1,
    left: 2,
    right: 3
  }
  # enum position: {
  #   'Верхний баннер 1920х600': 0,
  #   'Контент баннер 240х400': 1,
  #   'Левый баннер 160х600': 2,
  #   'Правый баннер 160х600': 3
  # }

  validates :position, :server_id, :publish, :date_start, :date_end, :banner_image, presence: true
end
