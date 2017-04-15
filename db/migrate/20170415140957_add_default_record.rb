class AddDefaultRecord < ActiveRecord::Migration[5.0]
  def change
  	change_column :players, :wins, :integer, default: 0
  	change_column :players, :losses, :integer, default: 0
  	change_column :players, :draws, :integer, default: 0
  end
end
