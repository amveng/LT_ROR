# frozen_string_literal: true

class PetitionsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :all_form,
                only: %i[
                  new server_rights_new
                ]
  before_action :all_create,
                only: %i[
                  create server_rights_create
                ]

  def index
    @petitions = current_user.petitions
  end

  def server_rights_new
    @servers = Server.pluck('urlserver').sort
  end

  def show
    @petition = Petition.find(params[:id])
    acces_close unless @petition.user_id == current_user.id
  end

  def create
    @petition.status = 'create'
    if @petition.save
      redirect_to petitions_path, success: 'Заявка создана.'
    else
      render :new
    end
  end

  def server_rights_create
    @petition.status = 'create'
    @petition.topic = 'Заявка на прикрепление сервера к учетной записи'
    if @petition.save
      redirect_to petitions_path, success: 'Заявка создана.'
    else
      render :server_rights_new
    end
  end

  private

  def all_form
    if Petition.where(user_id: current_user, status: 'create').count > 5
      redirect_to petitions_path, danger: 'Лимит для новых заявок исчерпан. Дождитесь проверки существующих заявок'
    else
      @petition = Petition.new
    end
  end

  def all_create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id
  end

  def acces_close
    # TODO: надо сделать какой то счетчик перед тем как банить
    # current_user.update_attributes(baned: true)
    redirect_to petitions_path, danger: 'Доступ запрещен !!!'
  end

  def petition_params
    params.require(:petition).permit(:topic, :body, :target, :user_id)
  end
end
