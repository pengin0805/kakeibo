Rails.application.routes.draw do
  root to: 'fixeds#index'
  resources :fixeds, only: [:create]
  resources :variables, only: [:create]
  resources :specials, only: [:index, :create]
end
