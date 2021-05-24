Rails.application.routes.draw do
  root to: 'costs#index'
  resources :costs, only: [:create]
  resources :variables, only: [:create]

end
