Rails.application.routes.draw do
  resources :games do
    member do
      get :configure
    end
    resources :turns, only: [:create]
  end

  devise_for :players
end
