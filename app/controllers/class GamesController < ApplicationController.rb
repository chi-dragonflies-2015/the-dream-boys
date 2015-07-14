class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save?
      #not sure where to redirect at this point
      redirect_to @game
    else
      render 'new'
  end

  def show
    @game = Game.find(params[:id])
  end



end
