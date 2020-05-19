Rails.application.routes.draw do
  root 'listservers#index'
  resources :listservers
end
