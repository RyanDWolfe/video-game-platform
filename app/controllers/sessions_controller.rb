class SessionsController < ApplicationController

  def new
    @player = Player.new
    @players = Player.all
  end

  def create
    if access_token = request.env["omniauth.auth"]
      player = Player.make_omni_player(access_token)
      session[:player_id] = player.id
      redirect_to games_path
    else
      player = Player.find_by(:email => params[:player][:email])
      if player && player.authenticate(params[:player][:password])
        session[:player_id] = player.id
        redirect_to games_path
      else
        @player = Player.new
        @players = Player.all
        flash[:notice] = "Incorrect Password"
        render 'sessions/new'
      end
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url
  end

end
