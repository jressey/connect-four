class Game < ApplicationRecord
	has_one :board

	before_create :set_players
	after_create :create_board

	private

		def set_players
			#TODO
		end
		
		def create_board
			self.board = Board.create
		end
end
