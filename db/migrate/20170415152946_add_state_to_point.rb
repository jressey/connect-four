class AddStateToPoint < ActiveRecord::Migration[5.0]
  def change
  	#make default invalid for simpler board generation
  	add_column :points, :state, :integer, default: 1
  end
end
