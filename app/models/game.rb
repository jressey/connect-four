class Game < ApplicationRecord
	has_one :board

	belongs_to :player_1, :class_name => "Player"
	belongs_to :player_2, :class_name => "Player"

	before_create :set_computer_player
	after_create :create_board

	private

		def set_computer_player
			self.player_2 = Player.find_by_name("computer_player_1")
		end
		
		def create_board
			self.board = Board.create
		end
end
