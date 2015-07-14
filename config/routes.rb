Rails.application.routes.draw do
  root "games#index"

  resources :games do
    resources :comments
  end

  get 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  get 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'


  resources :users do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :friends
end
