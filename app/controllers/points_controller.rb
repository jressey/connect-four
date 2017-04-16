class PointsController < ApplicationController

	def update
		@point = Point.find(params[:id])
		@point.update(point_params)
		@point.player_1! if params[:player_id].present? && Player.find(params[:player_id]) == @point.board.game.player_1
		@point.player_2! if params[:player_id].present? && Player.find(params[:player_id]) == @point.board.game.player_2

		board_analyzer = BoardAnalyzer.new(@point.board, @point, @point.player)
    	if board_analyzer.winning_position?
			@player = @point.player
			respond_to do |format|
	        	format.js { render template: "boards/show_winner" }
	      	end
		end
	
		@new_valid_point = Point.new_valid_point(@point) if @point.y_coord < 5
	end

	private

		def point_params
	      params.permit(:id, :board_id, :player_id, :state)
		end
end
