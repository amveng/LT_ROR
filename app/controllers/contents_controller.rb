# frozen_string_literal: true

class ContentsController < ApplicationController
  def show
    @menu = Content.where(menu_publish: true).order(id: :asc)
    @content = Content.friendly.find(params[:id])
  end
end
