class BoardsController < ApplicationController

	def process_gamestate
		@board = Board.find(params[:id])
		@player = Player.find(params[:last_player_id])
		@last_played_point = Point.find(params[:last_played_point_id])
		if @board.process_gamestate(@player, @last_played_point) == "winner"
			respond_to do |format|
	        	format.js { render template: "boards/show_winner" }
	      	end
	     end
	end
end
