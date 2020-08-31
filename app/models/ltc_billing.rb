# frozen_string_literal: true

# == Schema Information
#
# Table name: ltc_billings
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  amount       :decimal(, )
#  description  :string
#  product_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class LtcBilling < ApplicationRecord
  belongs_to :user
end
