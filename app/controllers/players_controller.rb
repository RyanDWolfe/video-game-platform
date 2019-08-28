class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def edit

  end

  def most_game_sessions
    @winner = Player.most_game_sessions
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
    player = Player.new(player_params)
    if player.save
      session[:player_id] = player.id
      redirect_to games_path
    else
      @player = Player.new
      render :new
    end
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
