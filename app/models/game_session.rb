class GameSession < ApplicationRecord
  belongs_to :player
  belongs_to :game

  def game_outcome(game_session)
    game = Game.find_by(id: game_session.game_id)
    if game_session.health == game.lose_parameter
      game_session.lose = 1
      game_outcome = "You Lost"
    elsif game_session.score == game.win_parameter
      game_session.win = 1
      game_outcome = "You Won"
    else
      playing
    end
  end

end
