class Player < ApplicationRecord
	has_many :games_as_player_1, class_name: "Game", foreign_key: "player_1_id"
	has_many :games_as_player_2, class_name: "Game", foreign_key: "player_2_id"
	has_many :points

	def self.computer_player
		return find_by(name: "computer_player_1")
	end
end
