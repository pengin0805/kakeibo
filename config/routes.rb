Rails.application.routes.draw do
  root to: 'fixeds#index'
  resources :fixeds, only: [:create, :destroy]
  resources :variables, only: [:create, :destroy]
  resources :specials, only: [:index, :create, :destroy]
end
