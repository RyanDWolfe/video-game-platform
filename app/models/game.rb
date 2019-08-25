class Game < ApplicationRecord

  validates :name, :description, :genre, :developer_id, :win_parameter, :lose_parameter, presence: true
  belongs_to :developer
  has_many :players, through: :game_sessions

end
