class SessionsController < ApplicationController

  def new
    @player = Player.new
    @players = Player.all
  end

  def create_facebook
    @player = Player.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']
    end
    session[:player_id] = @player.id
    redirect_to games_path
  end

  def create
    @player = Player.find_by(name: params[:player][:name])
    if @player && @player.authenticate(params[:player][:password])
      session[:player_id] = @player.id
      redirect_to games_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
