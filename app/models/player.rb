class Player < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  scope :most_game_sessions, -> {
    
    @winner = Player.joins(:game_sessions).group(:player_id).order(player_id.count)
    # @ordered = GameSession.group(:player_id).count
    # @winner_id = @ordered.max_by{|k,v| v}.first
    # @winner = Player.find(@winner_id)
  }

  has_many :game_sessions
  has_many :games, through: :game_sessions

  def self.make_omni_player(auth)
    where(email: auth.info.email).first_or_create do |player|
      player.name = auth.info.name
      player.password = SecureRandom.hex
    end
  end

end
