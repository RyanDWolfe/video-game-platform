class AddColumnToGameSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :win, :integer
    add_column :game_sessions, :loss, :integer
  end
end
