class RenameLosses < ActiveRecord::Migration[5.0]
  def change
  	rename_column :players, :loses, :losses
  end
end
