class GameSessionsController < ApplicationController

  before_action :set_game_session, only: [:show]

  def show

  end

  def new #abstract to a set_up_game method
    @game_session = GameSession.create(
      :player_id => params[:player_id],
      :game_id => params[:game_id]) #need to put these into params
  end

  def create
    @game_session = GameSession.new(game_session_params)
    if @game_session.save
      redirect_to @game_session
    else
      render :new
    end
  end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  def game_session_params
    params.require(:game_session).permit(:score, :health)
  end

end
