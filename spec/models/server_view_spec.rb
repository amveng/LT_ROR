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
        name: Faker::Ancient.titan
      )
      user = User.create(
        username: Faker::Internet.username(specifier: 4..42),
        email: Faker::Internet.email,
        password: Devise.friendly_token[0, 6]
      )
      server = Server.create(
        title: Faker::Ancient.hero,
        urlserver: Faker::Internet.url(scheme: 'https', path: ''),
        user_id: user.id,
        rate: rand(1..100),
        publish: 'published',
        status: rand(1..3),
        status_expires: 15.day.after,
        datestart: 10.day.after,
        serverversion_id: serverversion.id
      )
      server_view = ServerView.new(server_id: server.id)
      expect(server_view.save).to eq(true)
    end
  end
end
