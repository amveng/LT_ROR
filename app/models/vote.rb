class Vote < ApplicationRecord
  belongs_to :listserver
  belongs_to :user
end
