class SessionsController < ApplicationController

  def new
    @player = Player.new
    @players = Player.all #why is this here?
  end

  def create
    if access_token = request.env["omniauth.auth"]
      player = Player.make_omni_player(access_token)
      # Note: Refresh_token is only sent once during the first request
      refresh_token = access_token.credentials.refresh_token
      player.google_refresh_token = refresh_token if refresh_token.present?
      player.save
      session[:player_id] = player.id
      redirect_to games_path
    else
      @player = Player.find_by(:email => params[:player][:email])
      if @player && @player.authenticate(params[:player][:password])
        session[:player_id] = @player.id
        redirect_to games_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url
  end

  private

  # def player_params
  #   params.require(:player).permit(:name, :email, :password)
  # end

end
