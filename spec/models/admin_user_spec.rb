# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'проверяем наличие админа' do
    admin = AdminUser.first
    expect(admin.present?).to eq(true)
  end
  it 'проверяем смену стандартного пароля' do
    admin_standart = AdminUser.find_by(email: 'admin@example.com')
    valid = if admin_standart.present?
              admin_standart.valid_password?('password')
            else
              false
            end
    expect(valid).to eq(false)
  end
end
