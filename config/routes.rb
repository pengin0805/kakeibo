Rails.application.routes.draw do
  root to: 'fixeds#index'
  resources :fixeds, only: [:create, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :variables, only: [:create, :destroy]
  resources :specials, only: [:index, :create, :destroy]
  get "specials/test" => 'specials#test'
  resources :annuals, only: [:create]
end
