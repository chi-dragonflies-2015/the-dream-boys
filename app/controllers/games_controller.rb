class GamesController < ApplicationController

  def index
    @games = Game.all
    @user = User.find(1)
    # @comments = @games.comments.all
  end

  def new
    @game = Game.new
  end

  def add_to_library
    @user = User.find(1)
    @game = Game.find_by(params[:id])
    Ownership.create(owner_id: @user.id, game_id: @game.id)
    redirect_to index
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
