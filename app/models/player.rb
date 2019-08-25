class Player < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :game_sessions
  has_many :games, through: :game_sessions

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |player|
      player.name = auth.info.name
      player.email = auth.info.email
      player.password = SecureRandom.hex
    end
  end

end
