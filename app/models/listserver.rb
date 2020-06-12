# frozen_string_literal: true

class Listserver < ApplicationRecord
  belongs_to :user
  
  validates :dateStart, :version, presence: true
  validates :title, :urlServer, length: { in: 6..42 }
  validates :title, uniqueness: true


  # scope :unpublish, lambda {
  #   where(publish: false)
  # }  
end
