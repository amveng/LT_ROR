class ServerView < ApplicationRecord
  belongs_to :server

  scope :week, -> { where(date: 6.days.ago..Date.today) }
end
