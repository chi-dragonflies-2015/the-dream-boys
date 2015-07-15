class GamesController < ApplicationController


  def index
    # @current_user = User.find_by(id:session[:user_id])
    @games = Game.all
    @user = User.find_by(id: session[:user_id])
    @comments = Comment.all

  end

  def new
    @game = Game.new
  end

  def add_to_library
    @user = User.find(session[:user_id])
    @game = Game.find(params[:game_id])
    @user.games << @game
    redirect_to @user
  end

  def search
    @games = search_games(params[:search_term])
    render "games/index"
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

  private
    def game_params
      params.require(:game).permit(:title, :image_url, :description, :min_players,
                                    :max_players, :min_age, :min_time, :max_time)
    end



end
