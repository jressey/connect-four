class BoardAnalyzer

	def initialize(board, checkable_point, player)
		@board = board
		@checkable_point = checkable_point
		@player = player
		@x = @checkable_point.x_coord
		@y = @checkable_point.y_coord
	end
	
	def check_if_point_is_winner
		return false if @board.points.player_1.size + @board.points.player_2.size < 8
		return true if check_for_horizontal_winner
		return true if check_for_vertical_winner
		return false
	end

	def check_for_horizontal_winner
		# check left and right, if sum >= then win
		total_left = 0
		total_right = 0

		total_left = @x == 0 ? 0 : check_left
		total_right = @x == 6 ? 0 : check_right

		if total_left + total_right >= 3
			return true
		end
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

	def check_for_vertical_winner
		return true
	end
end