Rails.application.routes.draw do

  root "games#index"

  post "/users/:user_id/games" => 'games#add_to_library', as: "user_add_game"


  resources :games do
    resources :comments
  end

  post 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  post 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'

  post 'users/:user_id/games/search' => 'games#search', as: 'game_search'
  post 'users/search' => 'users#search', as: 'user_search'



  resources :users do
    resources :comments
  end

  resources :users do
    resources :games, except: :create
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :friends
end
