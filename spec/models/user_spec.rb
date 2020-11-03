# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      username: 'username',
      email: 'user@email.com',
      password: 'password'
    )
  end
  context 'валидации' do
    it 'проверка на сжимание пробелов и удаление первого из имени' do
      @user.username = ' na    me'
      expect(@user.save).to eq(true)
      expect(@user.username).to eq('na me')
    end

    it 'проверка на минимальную длину имени' do
      @user.username = 'nam'
      expect(@user.save).to eq(false)
    end

    it 'проверка на максимальную длину имени' do
      @user.username = 'n' * 43
      expect(@user.save).to eq(false)
    end

    it 'проверка на минимальную длину email' do
      @user.email = 'nam'
      expect(@user.save).to eq(false)
    end

    it 'проверка на максимальную длину email' do
      @user.email = 'n' * 43
      expect(@user.save).to eq(false)
    end

    it 'проверка на наличие времени голосования' do
      @user.next_votetime = nil
      expect(@user.save).to eq(false)
    end
  end

  it 'проверка на бан' do
    @user.baned = true
    @user.save
    expect(@user.active_for_authentication?).to eq(false)
  end
end
