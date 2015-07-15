Rails.application.routes.draw do

  resources :games
  root "home#index"


  resources :games do
    resources :comments
  end
  get 'games/:game_id/vote/:vote_value' => 'vote#create_vote_for_game'
  get 'comments/:comment_id/vote/:vote_value' => 'vote#create_vote_for_comment'


  resources :users do
    resources :games
  end
  resources :sessions, only: [:new, :create, :destroy]
end
