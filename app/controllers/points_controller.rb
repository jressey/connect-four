class PointsController < ApplicationController

	def update
		@point = Point.find(params[:id])
		@point.update(point_params)
		#this is a hack, should conditionally set state on update by checking games player id and player number (1 or 2)
		@point.player_1! if params[:player_id].present?

		@new_valid_point = Point.new_valid_point(@point) if @point.y_coord < 5
	end

	private

		def point_params
	      params.permit(:id, :board_id, :player_id, :state)
		end
end
