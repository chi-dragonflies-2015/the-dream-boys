class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(session[:user_id])
    puts "*** #{@user.games}"
  end

  def new
  end

  def create
    this_user = User.new(user_params)
    p this_user.inspect
    if this_user.save
      redirect_to "/"
    else
      @errors = this_user.errors
      render "users/new"
    end
  end




  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :password)
  end
end
