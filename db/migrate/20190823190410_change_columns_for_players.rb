class ChangeColumnsForPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :google_token, :string
    add_column :players, :google_refresh_token, :string
  end
end
