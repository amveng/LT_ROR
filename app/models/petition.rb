class Petition < ApplicationRecord
  belongs_to :user

  validates :topic, length: { maximum: 200 }
  validates :body, length: { maximum: 2000 }
  validates :topic, presence: true

  scope :last_update, lambda {
    order(updated_at: :asc)
  }
end
