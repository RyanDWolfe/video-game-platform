class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @game}
    end
  end

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @developers = Developer.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      @developers = Developer.all
      render :new
    end
  end

  def edit

  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :genre, :developer_id, :win_parameter, :lose_parameter)
  end

end
