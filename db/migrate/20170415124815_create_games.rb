class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :player
      t.string :state
      t.boolean :has_computer_player

      t.timestamps
    end
  end
end
