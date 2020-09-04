# frozen_string_literal: true

require 'rails_helper'
module Api
  module V1
    RSpec.describe GatesController, type: :controller do
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
        @vote = Vote.create(
          user_id: @user.id,
          server_id: @server.id,
          date: Date.today,
          user_ip: '8.8.8.8'
        )
      end

      context 'проверяем создание данных' do
        it 'Server ок' do
          server = Server.exists?(id: @server.id)
          expect(server).to eq(true)
        end
        it 'User ок' do
          user = User.exists?(id: @user.id)
          expect(user).to eq(true)
        end
        it 'Serverversion ок' do
          serverversion = Serverversion.exists?(id: @serverversion.id)
          expect(serverversion).to eq(true)
        end
        it 'Vote ок' do
          vote = Vote.exists?(id: @vote.id)
          expect(vote).to eq(true)
        end
      end

      context 'апи ответ' do
        it 'на пустой запрос - 403' do
          get :index
          expect(response.status).to eq(403)
        end

        it 'на ID и token - 406' do
          get :index, params: { id: @server.id, key: @server.token }
          expect(response.status).to eq(406)
        end

        it 'на ID и token unpublish - 403' do
          @server.update(publish: 'create')
          get :index, params: { id: @server.id, key: @server.token }
          expect(response.status).to eq(403)
        end

        it 'на user_IP - 200' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_ip: @vote.user_ip
          }
          expect(response.status).to eq(200)
        end

        it 'на user_ID - 200' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id
          }
          expect(response.status).to eq(200)
        end

        it 'на user_IP & user_ID - 200' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          expect(response.status).to eq(200)
        end

        it 'token ок' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          result = JSON.parse(response.body)['token'] == @vote.token
          expect(result).to eq(true)
        end

        it 'datetime ок' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          result = JSON.parse(response.body)['datetime'
          ] == @vote.created_at.strftime('%F %T')
          expect(result).to eq(true)
        end

        it 'на пост запрос с токеном голосования - 200' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          post :create, params: {
            id: @server.id, key: @server.token,
            token: @vote.token
          }
          expect(response.status).to eq(200)
        end

        it 'на правельный пост запрос ответ Токен активирован' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          post :create, params: {
            id: @server.id, key: @server.token,
            token: @vote.token
          }
          expect(response.body).to include('Токен активирован')
        end

        it 'на правельный пост запрос активация токена' do
          get :index, params: {
            id: @server.id, key: @server.token,
            user_id: @user.id, user_ip: @vote.user_ip
          }
          post :create, params: {
            id: @server.id, key: @server.token,
            token: @vote.token
          }
          confirmation = Vote.exists?(token: @vote.token, confirmation: true)
          expect(confirmation).to eq(true)
        end

        # it '#show successfully' do
        #   get :show, params: { id: Film.first.id }
        #   expect(response.status).to eq(200)
        #   # expect(response).to have_http_status(:ok)
        # end

        # it '#index to format json' do
        #   get :index
        #   expect(response.content_type).to eq 'application/json; charset=utf-8'
        # end
      end
    end
  end
end
