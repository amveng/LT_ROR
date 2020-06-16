class Poll < ApplicationRecord
  belongs_to :listserver
  has_many :votes
  has_many :userss, through: :votes
end
