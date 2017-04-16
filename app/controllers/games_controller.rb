class GamesController < ApplicationController

	def new
		@game = Game.create
		@game.update_attribute(:gametype, params[:gametype])
		respond_to do |format|
  			format.js { }
  		end
	end

	def update
		@game = Game.find(params[:id])
		@player_1 = Player.find_or_create_by(name: params[:player_one_name])
		if params[:player_two_name].present?
			@player_2 = Player.find_or_create_by(name: params[:player_two_name])
		else 
			#TODO: externalize name
			@player_2 = Player.computer_player
		end
  		@game.update_attributes(player_1: @player_1, player_2: @player_2)
  		@board = @game.board
  		respond_to do |format|
  			format.js { }
  		end
	end
end
