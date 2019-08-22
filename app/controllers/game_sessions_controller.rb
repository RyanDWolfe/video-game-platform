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
    binding.pry
    if @game_session.valid? && game_session.save
      redirect_to game_game_session_path(@game_session.game_id, @game_session.id)
    else
      render :new #this might need to be game path
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
