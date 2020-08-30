# frozen_string_literal: true

class ApiController < ApplicationController
  def v1
    id = params[:id]
    key = params[:key]
    user_ip = params[:user_ip]
    user_id = params[:user_id]
    if Server.where(id: id, token: key).blank?
      render json: { errors: 'Неверный ID или ключ' }, status: 403
    else

      vote = if user_id.present?
               Vote.where(user_ip: user_ip, user_id: user_id).last
             else
               Vote.where(user_ip: user_ip).last
             end
      if vote.blank?
        render json: { errors: 'Не найдено голосования' }, status: 406
      else
        render json: { token: vote.token, datetime: vote.created_at.strftime('%F %T') }, status: 200
      end
    end
  end
end
