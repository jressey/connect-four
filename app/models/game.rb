class Game < ApplicationRecord
	has_one :board

	after_create :create_board

	private

		def create_board
			self.board = Board.create
		end
end
