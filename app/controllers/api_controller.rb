# frozen_string_literal: true

class ApiController < ApplicationController
  def v1
    server_id = params[:id]
    key = params[:key]
    user_ip = params[:user_ip]
    user_id = params[:user_id]
    if Server.find_by(id: server_id, token: key).blank?
      render json: { errors: 'Неверный ID или ключ' }, status: 403
    else

      vote = Vote.where(user_ip: user_ip, user_id: user_id, server_id: server_id).last ||
             Vote.where(user_ip: user_ip, server_id: server_id).last ||
             Vote.where(user_id: user_id, server_id: server_id).last
      if vote.blank?
        render json: { errors: 'Не найдено голосования' }, status: 406
      else
        render json: { token: vote.token, datetime: vote.created_at.strftime('%F %T') }, status: 200
      end
    end
  end
end
