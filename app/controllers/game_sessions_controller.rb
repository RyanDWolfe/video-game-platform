class GameSessionsController < ApplicationController

  before_action :set_game_session, only: [:show, :new]

  def show

  end

  def new

  end

  def create
    @game_session = GameSession.new(game_session_params)
    @game_session.player_id = params[:player_id]
    @game_session.game_id = params[:game_id]
    @game_session.game_outcome(@game_session)
    if @game_session.save
      redirect_to game_game_session_path(@game_session.game_id, @game_session.id)
    elsif @game_session.valid?
      render :new #this might need to be game path
    else
      render :new
    end
  end

  private

  def set_game_session
    @game_session = GameSession.find_by(id: params[:id]) || GameSession.new
    @game = Game.find_by(id: params[:game_id])
    @player = Player.find_by(id: session[:player_id])
  end

  def game_session_params
    params.require(:game_session).permit(:score, :health)
  end

end
