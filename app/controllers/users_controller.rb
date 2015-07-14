class UsersController < ApplicationController
  def new
    render "users/create"
  end

  def create
    this_user = User.new(user_params)
    p this_user.inspect
    if this_user.save
      redirect_to "/"
    else
      @errors = this_user.errors
      render "users/create"
    end
  end




  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :password)
  end
end
