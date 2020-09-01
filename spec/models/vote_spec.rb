# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  server_id  :bigint
#  user_id    :bigint
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country    :string
#  token      :string
#  user_ip    :string
#
require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'проверяем создание данных' do
    it 'Vote автосоздание токена' do
      serverversion = Serverversion.create(
        name: 'serverversion'
      )
      user = User.create(
        username: 'us7ername',
        email: 'us7er@email.com',
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
      vote = Vote.create(
        user_id: user.id,
        server_id: server.id,
        date: Date.today,
        user_ip: '8.8.8.8'
      )
      expect(vote.token.present?).to eq(true)
    end
  end
end
