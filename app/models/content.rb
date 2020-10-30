# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id           :bigint           not null, primary key
#  name         :string
#  header       :string
#  menu         :string
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  menu_publish :boolean          default(FALSE), not null
#
class Content < ApplicationRecord
  extend FriendlyId

  validates :menu, presence: true

  friendly_id :name, use: :slugged
end
