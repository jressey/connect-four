class ChangeHowGameManagesState < ActiveRecord::Migration[5.0]
  def change
  	remove_column :games, :has_computer_player
  	add_column :games, :gametype, :integer
  end
end
