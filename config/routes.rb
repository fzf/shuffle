Rails.application.routes.draw do
  resources :games do
    resources :turns, only: [:create]
  end

  devise_for :players
end
