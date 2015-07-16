class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all.reject{|user|user.username == @current_user.username}
    else
      @users = User.all
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def add_to_friends
    @current_user = User.find_by(id: session[:user_id])
    @friend = User.find(params[:friend_id])
    @current_user.friendees << @friend
    redirect_to @current_user
  end

  def remove_from_friends
    @current_user = User.find_by(id: session[:user_id])
    @friend = User.find(params[:friend_id])
    @friendship_to_delete = @current_user.friendships.select do |friendship|
      (friendship.friender.id == @current_user.id && friendship.friendee.id == @friend.id) ||
      (friendship.friendee.id == @current_user.id && friendship.friender.id == @friend.id)
    end[0]
    @friendship_to_delete.destroy
    redirect_to "/users/#{@current_user.id}"
  end

  def search
    @users = search_users(params[:search_term])
    render "users/index"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    else
      @errors = @user.errors
      render "users/new"
    end
  end




  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :password)
  end
end
