class GameSession < ApplicationRecord

  validates :score, presence: true
  validates :health, presence: true
  validates :score, numericality: { only_integer: true }
  validates :health, numericality: { only_integer: true }

  belongs_to :player
  belongs_to :game

  def game_outcome(game_session)
    game = Game.find_by(id: game_session.game_id)
    if game_session.health == game.lose_parameter
      game_session.loss = 1
    elsif game_session.score == game.win_parameter
      game_session.win = 1
    else

    end
  end

end
