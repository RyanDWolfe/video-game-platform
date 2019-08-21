class Game < ApplicationRecord
  belongs_to :developer
  has_many :players, through: :game_sessions

  # def play_game
  #   @game = Game.new
  #   redirect_to new_game_sessions_path
  # end

  def game_outcome(game_session)
    if score == win_parameter
      @win = 1
    elsif health == lose_parameter
      @lose = 1
    else
      playing
    end
  end

end
