Rails.application.routes.draw do
  root "home#index"

  resources :games do
    resources :comments
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
