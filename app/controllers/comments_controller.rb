class CommentsController < ApplicationController
# respond_to :html, :js

  def index
    redirect_to "/"
  end

  def new
    unless session[:user_id]
      redirect_to "/"
      return ### Added this return inresponse to the following AbstractController::DoubleRenderError
             ### Render and/or redirect were called multiple times in this action. Please note that you may only call render OR redirect, and at most once per action. Also note that neither redirect nor render terminate execution of the action, so if you want to exit an action after redirecting,
             ### you need to do something like "redirect_to(...) and return".
    end
    @comment = Comment.new
    @user = User.find_by(id: session[:user_id])
    @game = Game.find_by(id: params[:game_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    unless session[:user_id]
      redirect_to "/"
      return ### SEE ABOVE
    end
    @errors = nil
    @comment = Comment.new(comment_params)
    @user = User.find_by(id: session[:user_id])
    @game = Game.find_by(id: params[:game_id])
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      @errors = @comment.errors
      respond_to do |format|
        format.js
      end
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


