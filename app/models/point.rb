class Point < ApplicationRecord
  belongs_to :board
  belongs_to :player

  enum state: [:valid_move, :invalid_move, :player_1, :player_2]

  def self.new_valid_point(point)
  	p2 = Point.where(board: point.board).where(x_coord: point.x_coord).where(y_coord: point.y_coord + 1).first
  	#bad hack
  	p2.player = point.player
  	p2.valid_move! 
  	return p2
  end

end
