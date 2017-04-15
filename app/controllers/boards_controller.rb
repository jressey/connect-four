class BoardsController < ApplicationController

	def process_gamestate
		@board = Board.find(params[:id])
		@board.process_gamestate
		respond_to do |format|
			format.js {}
		end
	end
end
