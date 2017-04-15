class PlayersController < ApplicationController

	#keep finding and creating 1 action for simplicity
	def create
  		@player = Player.find_or_create_by(name: player_params[:name])
  		@game = Game.create
  		@board = @game.board
  		respond_to do |format|
  			format.js {}
  		end
	end

	private

		def player_params
	      params.require(:player).permit(:name)
	    end
end
