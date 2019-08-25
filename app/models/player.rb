class Player < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  has_many :game_sessions
  has_many :games, through: :game_sessions

  def self.make_omni_player(auth)
    where(email: auth.info.email).first_or_create do |player|
      player.name = auth.info.name
      player.password = SecureRandom.hex
    end
  end

  def make_player(form)
    where(email: form.email).first_or_create do |player|
      player.name = form.name
      player.password = form.password
    end
  end

end
