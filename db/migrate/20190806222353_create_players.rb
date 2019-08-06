class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :password_digest
      t.integer :wins
      t.integer :loses
      t.timestamps
    end
  end
end
