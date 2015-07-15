Rails.application.routes.draw do
  root "games#index"

  resources :games


  resources :games do
    resources :comments
  end
  post 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  post 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
