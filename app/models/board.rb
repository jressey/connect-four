class Board < ApplicationRecord
  belongs_to :game
  has_many :points

  after_create :create_points

  def process_gamestate
    #TODO: find a better way to manage last point
    board_analyzer = BoardAnalyzer.new(self, point, player)
    # check for winner return win message
    # if non, generate computer move
      # check for blocking position
      # select randomly
      # update point for computer, return
    puts 'got here'
  end

  def latest_point
    self.points.order("updated_at").last
  end

  private

  	def create_points
      r = 5..0
  		(r.first).downto(r.last).each do |y|
  			(0..6).each do |x|
          point = self.points.create({ x_coord: x, y_coord: y })
          point.valid_move! if y == 0 
  			end
  		end
  	end
end
