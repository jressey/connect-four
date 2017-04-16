class BoardsController < ApplicationController

	def process_gamestate
		@board = Board.find(params[:id])
		@player = Player.find(params[:last_player_id])
		@last_played_point = Point.find(params[:last_played_point_id])
		gamestate_result = @board.process_gamestate(@player, @last_played_point)
		if @board.process_gamestate(@player, @last_played_point)
			respond_to do |format|
	        	format.js { render template: "boards/show_winner" }
	      	end
	    else
	    	@computer_point = @board.generate_computer_move(@player)
	    	@computer_won = @board.process_gamestate(@computer_point.player, @computer_point)
	    	if !@computer_won
	    		@new_valid_point = Point.new_valid_point(@computer_point)
	    	end
	    end
	end
end
