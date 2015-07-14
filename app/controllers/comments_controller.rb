class CommentsController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def show #probably not going to get used

  end
 ############ STRETCH GOAL ###############
  def edit
  end

  def update
  end

  def destroy
  end
 ########################################
end


#  game_comments GET    /games/:game_id/comments(.:format)          comments#index
#                   POST   /games/:game_id/comments(.:format)          comments#create
#  new_game_comment GET    /games/:game_id/comments/new(.:format)      comments#new
# edit_game_comment GET    /games/:game_id/comments/:id/edit(.:format) comments#edit
#      game_comment GET    /games/:game_id/comments/:id(.:format)      comments#show
#                   PATCH  /games/:game_id/comments/:id(.:format)      comments#update
#                   PUT    /games/:game_id/comments/:id(.:format)      comments#update
#                   DELETE /games/:game_id/comments/:id(.:format)      comments#destroy
