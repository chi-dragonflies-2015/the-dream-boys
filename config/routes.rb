Rails.application.routes.draw do

  resources :games
  root "games#index"

  post "/users/:user_id/games" => 'games#add_to_library', as: "user_add_game"

  resources :games do
    resources :comments
  end
  get 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  get 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'


  resources :users do
    resources :games, except: :create
  end

  resources :sessions, only: [:new, :create, :destroy]
end
