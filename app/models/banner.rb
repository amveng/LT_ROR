class Banner < ApplicationRecord
  belongs_to :server
  belongs_to :user

  enum publish: { created: 0, paid: 1, banned_from_showing: 2, published: 3, unverified: 4, finished: 5 }
  enum position: { top: 0, menu: 1, left: 2, right: 3 }

  validates :position, :publish, :date_start, :date_end, :image, presence: true
  # validates :position, :publish, numericality: { only_integer: true }
end
