# frozen_string_literal: true

class ServerView < ApplicationRecord
  belongs_to :server

  scope :week,
        lambda {
          where(date: 6.days.ago..Date.today)
        }
end
