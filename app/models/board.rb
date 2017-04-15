class Board < ApplicationRecord
  belongs_to :game
  has_many :points

  after_create :create_points

  private

  	def create_points
      r = 5..0
  		(r.first).downto(r.last).each.each do |y|
  			(0..6).each do |x|
          params = { x_coord: x, y_coord: y }
          point = self.points.create(params)
          point.valid_move! if y == 0 
  			end
  		end
  	end
end
