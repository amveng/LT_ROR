# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :gates, only: %i[index create] do
        collection do
          get 'server_rights'
        end
      end
    end
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'servers#index'

  get '/users', to: 'servers#index'

  resources :votes, only: [:create]

  resources :petitions, except: %i[destroy edit update] do
    collection do
      get 'server_rights_new'
      post 'server_rights_create'
    end
  end

  resources :servers do
    collection do
      get 'search'
      post 'publish'
      post 'generate_token'
      post 'vip'
      post 'top'
      post 'arhiv'
    end
  end

  resources :profiles do
    collection do
      get 'info'
      get 'servers'
      get 'balance'
      get 'vote_button'
      post 'safedelete'
      post 'top15'
      post 'top30'
      post 'publish_top'
      post 'arhiv_top'
      post 'menu15'
      post 'menu30'
      post 'publish_menu'
      post 'arhiv_menu'
      post 'reset_delay'
    end
  end

  resources :workers do
    collection do
      post 'main'
      post 'vote_fake'
      post 'fake_user'
      post 'parser_servers'
      post 'server_status'
      post 'server_check'
    end
  end

  resources :contents, only: [:show]
end
