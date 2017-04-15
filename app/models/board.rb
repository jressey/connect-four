class Board < ApplicationRecord
  belongs_to :game
  has_many :points

  after_create :create_points

  private

  	def create_points
      r = 5..0
  		(r.first).downto(r.last).each.each do |y|
  			(0..6).each do |x|
  				self.points.create(x_coord: x, y_coord: y)
  			end
  		end
  	end
end
