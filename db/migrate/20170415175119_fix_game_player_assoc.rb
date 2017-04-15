class FixGamePlayerAssoc < ActiveRecord::Migration[5.0]
  def change
  	rename_column :games, :player, :player_1_id
  	add_column :games, :player_2_id, :integer
  end
end
