Rails.application.routes.draw do
  get 'players/show'

  resources :games do
    member do
      get :configure
    end
    resources :turns, only: [:create]
  end

  devise_for :players
  resources :players, only: [:show]

  root 'games#index'
end
