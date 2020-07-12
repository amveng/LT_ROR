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

  root 'servers#index'

  get '/users', to: 'servers#index'

  resources :votes, only: [:create]

  resources :servers do
    collection do
      get 'search'
      post 'publish'
      post 'vip'
      post 'top'
    end
  end  

  resources :profiles do
    collection do
      get 'info'
      get 'servers'
      get 'balance'
      get 'vote_button'
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
