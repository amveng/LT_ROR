# frozen_string_literal: true

class ContentsController < ApplicationController
  before_action :all

  def respond_to_missing?(*_args)
    true
  end

  private

  def all
    @menu = Content.where(menu_publish: true).order(id: :asc)
    @content = Content.find_by(name: params[:action])
    render 'contents/content'
  end
end
