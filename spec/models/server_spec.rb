# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Server, type: :model do
  before(:each) do
    @serverversion = Serverversion.create(
      name: 'serverversion'
    )
    @user = User.create(
      username: 'username',
      email: 'user@email.com',
      password: 'password'
    )
    @server = Server.create(
      title: 'Server',
      urlserver: 'https://examle.com',
      user_id: @user.id,
      rate: 1,
      publish: 'published',
      status: 3,
      status_expires: 15.day.after,
      datestart: 10.day.after,
      serverversion_id: @serverversion.id
    )
  end
  context 'валидации' do
    it 'проверка на привидене названия к Капитализе' do
      @server.title = ' sErVeR'
      expect(@server.save).to eq(true)
      expect(@server.title).to eq('Server')
    end

    it 'проверка на наличие даты действия статуса' do
      @server.status_expires = nil
      expect(@server.save).to eq(false)
    end

    it 'проверка на наличие даты старта' do
      @server.datestart = nil
      expect(@server.save).to eq(false)
    end

    it 'проверка на наличие статуса' do
      @server.status = nil
      expect(@server.save).to eq(false)
    end

    it 'проверка на наличие статуса публикации' do
      @server.publish = nil
      expect(@server.save).to eq(false)
    end

    it 'проверка на минимальную длину названия' do
      @server.title = '123'
      expect(@server.save).to eq(false)
    end

    it 'проверка на максимальную длину названия' do
      @server.title = 'a' * 43
      expect(@server.save).to eq(false)
    end

    it 'проверка на уникльность названия' do
      server = Server.new(
        title: 'Server',
        urlserver: 'https://examle.com',
        user_id: @user.id,
        rate: 1,
        publish: 'published',
        status: 3,
        status_expires: 15.day.after,
        datestart: 10.day.after,
        serverversion_id: @serverversion.id
      )
      expect(server.save).to eq(false)
    end

    it 'проверка на максимальную длину описания' do
      @server.description = 'a' * 401
      expect(@server.save).to eq(false)
    end

    it 'проверка на целочисленность рейтов' do
      @server.rate = 1.1
      expect(@server.save).to eq(false)
    end

    it 'проверка на коррктный адрес сервера' do
      @server.urlserver = 'http://examle.com'
      expect(@server.save).to eq(false)
    end
  end
end
