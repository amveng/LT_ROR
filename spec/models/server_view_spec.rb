# frozen_string_literal: true

# == Schema Information
#
# Table name: server_views
#
#  id        :bigint           not null, primary key
#  server_id :bigint
#  viewer    :string
#  date      :date
#
require 'rails_helper'

RSpec.describe ServerView, type: :model do
  context 'проверяем создание данных' do
    it 'ServerView ok' do
      serverversion = Serverversion.create(
        name: 'serverversion'
      )
      user = User.create(
        username: 'username',
        email: 'user@email.com',
        password: 'password'
      )
      server = Server.create(
        title: 'Server',
        urlserver: 'https://examle.com',
        user_id: user.id,
        rate: 1,
        publish: 'published',
        status: 3,
        status_expires: 15.day.after,
        datestart: 10.day.after,
        serverversion_id: serverversion.id
      )
      server_view = ServerView.new(server_id: server.id)
      expect(server_view.save).to eq(true)
    end
  end
end
