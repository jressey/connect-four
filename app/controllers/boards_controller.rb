class BoardsController < ApplicationController

	def computer_move
		respond_to do |format|
			format.js {}
		end
	end
end
