Rails.application.routes.draw do

  root "games#index"

  post "/users/:user_id/games" => 'games#add_to_library', as: "user_add_game"

  post "/users/:user_id/friends" => 'users#add_to_friends', as: "user_add_friend"
  delete "/users/:user_id/friends" => 'users#remove_from_friends', as: "user_remove_friend"


  resources :games do
    resources :comments
  end

  post 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  post 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'

  resources :users do
    resources :comments
  end

  resources :users do
  end

  resources :users do
    resources :games, except: :create
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :friends
end
