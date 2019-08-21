class GameSessionsController < ApplicationController

  before_action :set_game_session, only: [:show]

  def show

  end

  def new #abstract to a set_up_game method
    @game = Game.find_by(id: params[:game_id])
    @player = Player.find_by(id: session[:player_id])
    @game_session = GameSession.new
    @game_session.player_id = @player.id
    @game_session.game_id = @game.id
  end

  def create
    @game_session = GameSession.new(game_session_params)
    @game_session.player_id = params[:player_id]
    @game_session.game_id = params[:game_id]
    if @game_session.save
      redirect_to game_game_session_path(@game_session.game_id, @game_session.id)
    else
      render :new #this might need to be game path
    end
  end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  def game_session_params
    params.require(:game_session).permit(:score, :health, :game_id, :player_id)
  end

end
