# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
   { omniauth_callbacks: 'omniauth', registrations: 'users/registrations' }
  # devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :servers
  resources :votes, only: [:create]
  root 'servers#index'
  get '/users', to: 'servers#index'  
  # get '/users' => 'users/registrations'
  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # resources :users
  # resources :profiles
  resources :profiles do
    collection do
      get 'info'
      get 'servers'
      post 'safedelete'
    end
  end
end
