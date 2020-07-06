# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
   { omniauth_callbacks: 'omniauth', registrations: 'users/registrations' }
  # devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :servers do
    collection do
      get 'search'
    end
  end
  resources :votes, only: [:create]
  # root 'servers#index'
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
      # Content.pluck('title').each do |f|
      #   get f
      # end
      get 'about'
      get 'advertising'
      get 'contact'
      get 'privacy'
      get 'terms_of_use'
    end
  end
end
