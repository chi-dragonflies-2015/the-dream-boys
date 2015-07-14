class CommentsController < ApplicationController

  def index
    redirect_to "/"
  end

  def new

  end

  def create
  current_comment = Comment.new(comment_params)
    if current_comment.save && session[:user_id]
      redirect_to "/"
    else
      render "comments/new"
    end
  end

  def show #probably not going to get used
    redirect_to "/"
  end
 ############ STRETCH GOAL ###############
  def edit
  end

  def update
  end

  def destroy
  end
 ########################################

 private
 def comment_params
    params.require(:comment).permit(:game_id, :content, :commenter_id)
 end
end


