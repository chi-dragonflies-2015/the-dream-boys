class SessionsController < ApplicationController
  def new
    puts UsersHelper::search_users("er").inspect
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      @errors = "Login unsuccessful"
      render "sessions/new"
    end
  end

  def delete
    sessions[:user_id] = nil
    redirect_to "/"
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
