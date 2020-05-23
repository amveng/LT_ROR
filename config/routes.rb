Rails.application.routes.draw do
  devise_for :users
  root 'listservers#index'
  resources :listservers
end
