# frozen_string_literal: true

class WorkersController < ApplicationController
  before_action :authenticate_admin_user!

  def main
    MainWorker.perform_async
    redirect_to adm315_root_path, notice: 'Воркер запущен'
  end

  def vote_fake
    VoteFakeWorker.perform_async
    redirect_to adm315_root_path, notice: 'Воркер запущен'
  end

  def fake_user
    FakeUserWorker.perform_async(100)
    redirect_to adm315_root_path, notice: 'Воркер запущен'
  end

  def parser_servers
    ParserServerWorker.perform_async
    redirect_to adm315_root_path, notice: 'Воркер запущен'
  end

  def server_status
    ServerStatusWorker.perform_async
    redirect_to adm315_root_path, notice: 'Воркер запущен'
  end
end
