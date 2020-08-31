# frozen_string_literal: true

# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string(10)       not null
#  name       :string(100)      not null
#  iso3       :string(3)        not null
#  numeric    :integer          not null
#  eu         :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#
class Country < ActiveRecord::Base
  validates :code, length: { maximum: 5 }, uniqueness: true
  validates :name, length: { maximum: 100 }
  validates :iso3, length: { maximum: 3 }
  validates :iso3, :name, :code, :numeric, presence: true
end
