class Vote < ApplicationRecord
  belongs_to :server
  belongs_to :user

  scope :month, -> { where(date: 30.days.ago..0.days.ago) }
end
