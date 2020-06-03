# frozen_string_literal: true

class Listserver < ApplicationRecord
  belongs_to :user
  
  validates :title, :urlServer, :dateStart, presence: true


  # scope :unpublish, lambda {
  #   where(publish: false)
  # }  
end
