# frozen_string_literal: true

# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  server_id  :bigint
#  user_id    :bigint
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country    :string
#  token      :string
#  user_ip    :string
#
class Vote < ApplicationRecord
  belongs_to :server
  belongs_to :user

  before_create lambda {
    self.token = generate_token
  }

  scope :month, lambda {
    where(date: 30.days.ago..0.days.ago)
  }
  scope :notnil, lambda {
    where.not(country: nil)
  }

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless Vote.exists?(token: token)
    end
  end
end
