class BoardsController < ApplicationController

	def process_gamestate
		@board = Board.find(params[:id])
		@player = Player.find(params[:last_player_id])
		@last_played_point = Point.find(params[:last_played_point_id])
		gamestate_result = @board.process_gamestate(@player, @last_played_point)
		if @board.process_gamestate(@player, @last_played_point) == "player winner"
			respond_to do |format|
	        	format.js { render template: "boards/show_winner" }
	      	end
	    else
	    	@computer_point = @board.generate_computer_move(@player)
	    	# byebug
	    	@new_valid_point = Point.new_valid_point(@computer_point)
	    end
	end
end
