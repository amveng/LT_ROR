class Vote < ApplicationRecord
  belongs_to :server
  belongs_to :user
end
