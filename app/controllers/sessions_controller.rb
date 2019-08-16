class SessionsController < ApplicationController

  def new
    @player = Player.new
    @players = Player.all
  end

  def create
    @player = Player.find_by(name: params[:player][:name])
    if @player && @player.authenticate(params[:player][:password])
      session[:player_id] = @player.id
      redirect_to games_path #do I need to pass info here?
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url
  end

end
