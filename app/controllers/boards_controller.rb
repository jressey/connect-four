class BoardsController < ApplicationController

	def process_gamestate
		@board = Board.find(params[:id])
		@player = Player.find(params[:last_player_id])
		@board.process_gamestate(@player)
		respond_to do |format|
			format.js {}
		end
	end
end
