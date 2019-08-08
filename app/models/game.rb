class Game < ApplicationRecord
  belongs_to :developer
  has_many :players, through: :game_sessions
end
