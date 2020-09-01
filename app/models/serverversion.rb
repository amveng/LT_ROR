# == Schema Information
#
# Table name: serverversions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
class Serverversion < ApplicationRecord
  has_many :servers

  validates :name, presence: true
end

