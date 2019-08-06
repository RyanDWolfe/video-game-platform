class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :score
      t.integer :health
      t.integer :win_parameter
      t.integer :lose_parameter
      t.timestamps
    end
  end
end
