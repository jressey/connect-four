class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.belongs_to :board, foreign_key: true
      t.belongs_to :player, foreign_key: true

      t.timestamps
    end
  end
end
