# frozen_string_literal: true

class Content < ApplicationRecord
  extend FriendlyId

  validates :menu, presence: true

  friendly_id :name, use: :slugged
end
