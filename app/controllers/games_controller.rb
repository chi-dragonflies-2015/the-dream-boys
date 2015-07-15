class GamesController < ApplicationController

  def index
    # @current_user = User.find_by(id:session[:user_id])
    @games = Game.all

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save?

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
                                    :max_players, :min_age, :min_time, :ma)
    end



end
