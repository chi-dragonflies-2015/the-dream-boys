class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session_params[:id])
    if @user.authenticate(session_params[:password])
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
