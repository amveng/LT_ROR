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
require 'rails_helper'

RSpec.describe LtcBilling, type: :model do
  context 'проверяем создание данных' do
    it 'LtcBilling ok' do
      user = User.create(
        username: 'username',
        email: 'user@email.com',
        password: 'password'
      )
      billing = LtcBilling.new(user_id: user.id)
      expect(billing.save).to eq(true)
    end
  end
end
