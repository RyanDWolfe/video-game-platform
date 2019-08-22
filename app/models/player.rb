class Player < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  has_many :game_sessions
  has_many :games, through: :game_sessions
  
end
