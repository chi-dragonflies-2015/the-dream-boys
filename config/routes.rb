Rails.application.routes.draw do

  resources :games
  root "home#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
