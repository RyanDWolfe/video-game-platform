class AddColumnToGameSessions2 < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :score, :integer
    add_column :game_sessions, :health, :integer
  end
end
