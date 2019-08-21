class Game < ApplicationRecord
  belongs_to :developer
  has_many :players, through: :game_sessions

  # def play_game
  #   @game = Game.new
  #   redirect_to new_game_sessions_path
  # end



end
