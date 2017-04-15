class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end
