class SessionsController < ApplicationController
  def new
    puts "********** #{Game.find_by(title: 'Risk').tags.inspect}"
    puts "*********** #{search_games("shoo").inspect}"
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

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
