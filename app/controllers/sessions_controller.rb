class SessionsController < ApplicationController

  def new

  end

  def create

  end

  def destroy
    session[:player_id] = nil
    redirect_to root_url
  end

end
