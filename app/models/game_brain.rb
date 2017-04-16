class GameBrain

	def self.select_computer_point(board)
		#TODO: another hack from poor player management
		player = board.game.player_1
		valid_points = board.points.valid_move
		valid_points.each do |p|
			return p if BoardAnalyzer.new(board, p, player).winning_position?
		end
		puts valid_points.size
		return valid_points.sample
	end
end