Rails.application.routes.draw do

  root "home#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
