# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
   {omniauth_callbacks: 'omniauth', registrations: 'users/registrations'}
  # devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'listservers#index'
  resources :listservers
  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # resources :users
end
