class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_player
  #before_action :require_logged_in, except: [:new, :create, :home] # Modify...

  def logged_in?
    !!current_player
  end

private

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  helper_method :current_player
  
end
