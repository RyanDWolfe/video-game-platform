class RemoveColumnsFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :wins
    remove_column :players, :loses
    remove_column :players, :uid
  end
end
