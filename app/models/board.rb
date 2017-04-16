class Board < ApplicationRecord
  belongs_to :game
  has_many :points

  after_create :create_points

  def process_gamestate(last_player, played_point)
    #TODO: find a better way to manage last point
    board_analyzer = BoardAnalyzer.new(self, played_point, last_player)
    return "winner" if board_analyzer.winning_position?
    # if non, generate computer move
      # check for blocking position
      # select randomly
      # update point for computer, return
    puts 'got here'
  end

  def new_valid_point
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
