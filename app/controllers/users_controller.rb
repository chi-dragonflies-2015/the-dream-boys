class UsersController < ApplicationController
  def index
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      puts "***** #{@current_user.inspect}"
      @users = User.all.reject{|user|user.username == @current_user.username}
      puts "***** #{@users.inspect}"
    else
      @users = User.all
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
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
