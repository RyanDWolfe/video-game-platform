class Player < ApplicationRecord
  has_secure_password
  has_many :game_sessions
  has_many :games, through: :game_sessions
end
