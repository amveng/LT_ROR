# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :servers do
    collection do
      get 'search'
      post 'publish'
      post 'vip'
      post 'top'
    end
  end

  resources :votes, only: [:create]
  root 'servers#index'
  get '/users', to: 'servers#index'
  resources :profiles do
    collection do
      get 'info'
      get 'servers'
      post 'safedelete'
    end
  end

  resources :contents do
    collection do
      get 'about'
      get 'advertising'
      get 'contact'
      get 'privacy'
      get 'terms_of_use'
    end
  end
end
