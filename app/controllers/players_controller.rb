class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def edit

  end

  def show
    @games = Game.all
    @game_sessions = @player.game_sessions.where(:player_id == @player.id)
  end

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    redirect_to new_session_path
  end

  def update
    if @player.update(player_params)
      redirect_to @player
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :email, :password)
  end

end
