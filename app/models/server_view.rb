# frozen_string_literal: true

# == Schema Information
#
# Table name: server_views
#
#  id        :bigint           not null, primary key
#  server_id :bigint
#  viewer    :string
#  date      :date
#
class ServerView < ApplicationRecord
  belongs_to :server

  scope :week, lambda {
    where(date: 6.days.ago..Date.today)
  }
end
