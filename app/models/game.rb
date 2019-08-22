class Game < ApplicationRecord
  
  validates :name, presence: true
  belongs_to :developer
  has_many :players, through: :game_sessions

end
