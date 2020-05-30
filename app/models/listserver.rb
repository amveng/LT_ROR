# frozen_string_literal: true

class Listserver < ApplicationRecord
  belongs_to :user
  scope :unpublish, lambda {
    where(publish: nil)
  }
end
