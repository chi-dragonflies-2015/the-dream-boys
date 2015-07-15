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

  def search
    puts "*********** #{params[:search_term]}"
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
