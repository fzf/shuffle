Rails.application.routes.draw do
  get 'players/show'

  resources :games do
    member do
      get :configure
    end
    resources :turns, only: [:create]
  end

  resources :players, only: [:index, :show, :edit, :update]

  devise_for :players

  root 'games#index'
end
