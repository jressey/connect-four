class Point < ApplicationRecord
  belongs_to :board
  belongs_to :player

  enum state: [:valid_move, :invalid_move, :player_1, :player_2]

  scope :at_coords, -> (x,y) { where(x_coord: x, y_coord: y) }

  def self.new_valid_point(point)
  	valid_point = Point.where(board: point.board).where(x_coord: point.x_coord).where(y_coord: point.y_coord + 1).first
  	#keep the player the same, computer entered moves will not rely on the link
  	if valid_point.present?
      valid_point.valid_move!
  	  return valid_point 
    end
  end

end
