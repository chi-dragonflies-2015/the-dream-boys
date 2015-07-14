class UsersController < ApplicationController
  def create
    this_user = User.new(user_params)
    if this_user.save
      redirect '/'
    else
      @errors =
    end

  end




  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :password)
  end
end
