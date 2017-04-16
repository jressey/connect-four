class BoardAnalyzer

	def initialize(board, checkable_point, player)
		@board = board
		@checkable_point = checkable_point
		@player = player
		@x = @checkable_point.x_coord
		@y = @checkable_point.y_coord
	end
	
	def winning_position?
		return false if @board.points.player_1.size + @board.points.player_2.size < 8
		return true if horizontal_winning_position?
		return true if vertical_winning_position?
		return true if diagonal_winning_position?
		return false
	end

	def horizontal_winning_position?
		total_left = 0
		total_right = 0

		total_left = @x == 0 ? 0 : check_left
		total_right = @x == 6 ? 0 : check_right
		return true if total_left + total_right >= 3
		return false
	end

	def vertical_winning_position?
		return false if @checkable_point.y_coord <= 2
		return check_bottom
	end

	def diagonal_winning_position?
		total_bottom_left = 0
		total_top_right = 0
		total_top_left = 0
		total_bottom_right = 0

		total_bottom_left = (@x == 0 || @y == 0) ? 0 : check_bottom_left
		total_top_right = (@x == 6 || @y == 5) ? 0 : check_top_right
		return true if total_bottom_left + total_top_right >= 3

		total_top_left = (@x == 0 || @y == 5) ? 0 : check_top_left
		total_bottom_right = (@x == 6 || @y == 0) ? 0 : check_bottom_right
		return true if total_top_left + total_bottom_right >= 3

		return false
	end

	def check_left
		total = 0
		if @x - 1 >= 0
			p = @board.points.where(x_coord: @x - 1).where(y_coord: @y).first.player
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0
					p = @board.points.where(x_coord: @x - 2).where(y_coord: @y).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0
						p = @board.points.where(x_coord: @x - 3).where(y_coord: @y).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	def check_right
		total = 0
		if @x + 1 <= 6
			p = @board.points.where(x_coord: @x + 1).where(y_coord: @y).first.player
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= 6
					p = @board.points.where(x_coord: @x + 2).where(y_coord: @y).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= 6
						p = @board.points.where(x_coord: @x + 3).where(y_coord: @y).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	def check_bottom
		total = 0
		p = @board.points.where(x_coord: @x).where(y_coord: @y - 1).first.player
		if (p.present? && p == @player)
			total += 1	
			p = @board.points.where(x_coord: @x).where(y_coord: @y - 2).first.player
			if (p.present? && p == @player)
		 		total += 1
		 		p = @board.points.where(x_coord: @x).where(y_coord: @y - 3).first.player
				if (p.present? && p == @player)
			 		total += 1
			 	end
			end
		end
		return total >= 3
	end

	def check_bottom_left
		total = 0
		if @x - 1 >= 0 && @y - 1 >= 0
			p = @board.points.where(x_coord: @x - 1).where(y_coord: @y - 1).first.player
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0  && @y - 2 >= 0
					p = @board.points.where(x_coord: @x - 2).where(y_coord: @y - 2).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0 && @y - 3 >= 0
						p = @board.points.where(x_coord: @x - 3).where(y_coord: @y - 3).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	def check_top_right
		total = 0
		if @x + 1 <= 6 && @y + 1 <= 5
			p = @board.points.where(x_coord: @x + 1).where(y_coord: @y + 1).first.player
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= 6  && @y + 2 <= 5
					p = @board.points.where(x_coord: @x + 2).where(y_coord: @y + 2).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= 6 && @y + 3 <= 5
						p = @board.points.where(x_coord: @x + 3).where(y_coord: @y + 3).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	def check_top_left
		total = 0
		if @x - 1 >= 0 && @y + 1 <= 5
			p = @board.points.where(x_coord: @x - 1).where(y_coord: @y + 1).first.player
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0  && @y + 2 <= 5
					p = @board.points.where(x_coord: @x - 2).where(y_coord: @y + 2).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0 && @y + 3 <= 5
						p = @board.points.where(x_coord: @x - 3).where(y_coord: @y + 3).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	def check_bottom_right
		total = 0
		if @x + 1 <= 6 && @y - 1 >= 0
			p = @board.points.where(x_coord: @x + 1).where(y_coord: @y - 1).first.player
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= 6 && @y - 2 >= 0
					p = @board.points.where(x_coord: @x + 2).where(y_coord: @y - 2).first.player
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= 6 && @y - 3 >= 0
						p = @board.points.where(x_coord: @x + 3).where(y_coord: @y - 3).first.player
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

end