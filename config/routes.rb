Rails.application.routes.draw do

  root "games#index"

  post "/users/:user_id/games" => 'games#add_to_library', as: "user_add_game"


  resources :games do
    resources :comments
  end

  post 'games/:game_id/vote/:vote_value' => 'votes#create_vote_for_game'
  post 'comments/:comment_id/vote/:vote_value' => 'votes#create_vote_for_comment'

  resources :users do
    resources :comments
  end

  resources :users do
    resources :games, except: :create
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :friends
end
