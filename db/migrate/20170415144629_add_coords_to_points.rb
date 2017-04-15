class AddCoordsToPoints < ActiveRecord::Migration[5.0]
  def change
  	add_column :points, :x_coord, :integer
  	add_column :points, :y_coord, :integer
  end
end
