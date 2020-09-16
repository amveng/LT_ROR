# frozen_string_literal: true

class PetitionsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @petitions = current_user.petitions
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id
    if @petition.save
      redirect_to petitions_path, success: 'Заявка создана.'
    else
      flash.now[:danger] = 'Заявка не создана'
      render :new
    end

  end

  private

  def petition_params
    params.require(:petition).permit(:topic, :body, :target, :user_id)
  end
end
