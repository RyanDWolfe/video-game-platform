class RemoveColumnFromGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :score
    remove_column :games, :health
  end
end
