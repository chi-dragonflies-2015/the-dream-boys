class CommentsController < ApplicationController

  def index
    redirect_to "/"
  end

  def new
    unless session[:user_id]
      puts "TEST"
      redirect_to "/"
    end
    @comment = Comment.new
    @user = User.find_by(id: session[:user_id])
    @game = Game.find_by(id: params[:game_id])
  end

  def create
    unless session[:user_id]
      redirect_to "/"
    end
    @comment = Comment.new(comment_params)
    @user = User.find_by(id: session[:user_id])
    @game = Game.find_by(id: params[:game_id])

    if @comment.save
      redirect_to "/"
    else
      puts "ERRORS"
      @comment.errors
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


