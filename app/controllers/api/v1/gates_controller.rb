# frozen_string_literal: true

module Api
  module V1
    class GatesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        server_id = params[:id]
        key = params[:key]
        user_ip = params[:user_ip]
        user_id = params[:user_id]
        if Server.find_by(id: server_id, token: key, publish: 'published').blank?
          render json: { errors: 'Неверный ID или ключ' }, status: 403
        else
          vote = Vote.where(
            user_ip: user_ip, user_id: user_id, server_id: server_id, confirmation: false
          ).last || Vote.where(
            user_ip: user_ip, server_id: server_id, confirmation: false
          ).last || Vote.where(
            user_id: user_id, server_id: server_id, confirmation: false
          ).last
          if vote.blank?
            render json: {
              errors: 'Не найдено голосования'
            }, status: 406
          else
            render json: {
              token: vote.token, datetime: vote.created_at.strftime('%F %T')
            }, status: 200
          end
        end
      end

      def create
        server_id = params[:id]
        key = params[:key]
        token = params[:token]
        if Server.find_by(id: server_id, token: key, publish: 'published').blank?
          render json: { errors: 'Неверный ID или ключ' }, status: 403
        else
          vote = Vote.where(confirmation: false, token: token)
          if vote.blank?
            render json: { errors: 'Не найдено голосования' }, status: 406
          else
            vote.update(confirmation: true)
            render json: { token: 'Токен активирован' }, status: 200
          end
        end
      end

      def server_rights
        user = User.where(id: params[:id]).first
        server = Server.where(ip: request.remote_ip).first
        if server.present? && user.present?
          if server.user_id == user.id
            render json: { server: 'Сервер уже был добавлен в профиль пользователя' }, status: 200
          else
          server.update(user_id: user.id)
          render json: { server: 'Сервер добавлен в профиль пользователя' }, status: 200
          end
        else
          render json: { errors: 'Ошибка добавления сервера' }, status: 406
        end
      end
    end
  end
end
