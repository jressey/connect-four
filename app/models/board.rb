class Board < ApplicationRecord
  belongs_to :game
  has_many :points

  after_create :create_points

  def process_gamestate(last_player, played_point)
    board_analyzer = BoardAnalyzer.new(self, played_point, last_player)
    return board_analyzer.winning_position?
  end

  def generate_computer_move(last_player)
    computer_point = GameBrain.select_computer_point(self)
    puts computer_point
    computer_point.player_2!
    computer_point.update_attribute(:player, self.game.opponent_of(last_player))
    return computer_point
  end

  def new_valid_point
    self.points.order("updated_at").last
  end

  def tie?
    points.player_1.size + points.player_2.size == BoardDetails::Width * BoardDetails::Height
  end

  private

  	def create_points
      r = BoardDetails::Height - 1..0
  		(r.first).downto(r.last).each do |y|
  			(0..BoardDetails::Width - 1).each do |x|
          point = self.points.create({ x_coord: x, y_coord: y })
          point.valid_move! if y == 0 
  			end
  		end
  	end
end
