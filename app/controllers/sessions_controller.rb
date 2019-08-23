class SessionsController < ApplicationController

  def new
    @player = Player.new
    @players = Player.all
  end

  def googleAuth
      # Get access tokens from the google server
      access_token = request.env["omniauth.auth"]
      player = Player.from_omniauth(access_token)
      log_in(player)
      # Access_token is used to authenticate request made from the rails application to the google server
      player.google_token = access_token.credentials.token
      session[:player_id] = player.id
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
      refresh_token = access_token.credentials.refresh_token
      player.google_refresh_token = refresh_token if refresh_token.present?
      player.save
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
