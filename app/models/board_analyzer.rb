class BoardAnalyzer

	def initialize(board, checkable_point, player)
		@board = board
		@checkable_point = checkable_point
		@player = player
		@x = @checkable_point.x_coord
		@y = @checkable_point.y_coord
		@right_bound = BoardDetails::Width - 1
		@top_bound = BoardDetails::Height - 1
	end
	
	def winning_position?
		return true if vertical_winning_position?
		return true if horizontal_winning_position?
		return true if diagonal_winning_position?
		return false
	end

	def vertical_winning_position?
		return false if @checkable_point.y_coord <= 2
		return check_bottom
	end

	def horizontal_winning_position?
		total_left = 0
		total_right = 0

		total_left = @x == 0 ? 0 : check_left
		total_right = @x == BoardDetails::Width ? 0 : check_right
		return true if total_left + total_right >= 3
		return false
	end

	def diagonal_winning_position?
		total_bottom_left = 0
		total_top_right = 0
		total_top_left = 0
		total_bottom_right = 0

		total_bottom_left = (@x == 0 || @y == 0) ? 0 : check_bottom_left
		total_top_right = (@x == @right_bound || @y == @top_bound) ? 0 : check_top_right
		return true if total_bottom_left + total_top_right >= 3

		total_top_left = (@x == 0 || @y == @top_bound) ? 0 : check_top_left
		total_bottom_right = (@x == @right_bound  || @y == 0) ? 0 : check_bottom_right
		return true if total_top_left + total_bottom_right >= 3

		return false
	end

	def check_left
		total = 0
		if @x - 1 >= 0
			p = point_owner_at(@x - 1, @y)
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0
					p = point_owner_at(@x - 2, @y)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0
						p = point_owner_at(@x - 3, @y)
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
		if @x + 1 <= @right_bound
			p = point_owner_at(@x + 1, @y)
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= @right_bound
					p = point_owner_at(@x + 2, @y)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= @right_bound
						p = point_owner_at(@x + 3, @y)
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
		p = point_owner_at(@x, @y - 1)
		if (p.present? && p == @player)
			total += 1	
			p = point_owner_at(@x, @y - 2)
			if (p.present? && p == @player)
		 		total += 1
		 		p = point_owner_at(@x, @y - 3)
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
			p = point_owner_at(@x - 1, @y - 1)
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0  && @y - 2 >= 0
					p = point_owner_at(@x - 2, @y - 2)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0 && @y - 3 >= 0
						p = point_owner_at(@x - 3, @y - 3)
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
		if @x + 1 <= @right_bound && @y + 1 <= @top_bound
			p = point_owner_at(@x + 1, @y + 1)
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= @right_bound  && @y + 2 <= @top_bound
					p = point_owner_at(@x + 2, @y + 2)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= @right_bound && @y + 3 <= @top_bound
						p = point_owner_at(@x + 3, @y + 3)
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
		if @x - 1 >= 0 && @y + 1 <= @top_bound
			p = point_owner_at(@x - 1, @y + 1)
			if (p.present? && p == @player)
				total += 1
				if @x - 2 >= 0  && @y + 2 <= @top_bound
					p = point_owner_at(@x - 2, @y + 2)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x - 3 >= 0 && @y + 3 <= @top_bound
						p = point_owner_at(@x - 3, @y + 3)
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
		if @x + 1 <= @right_bound && @y - 1 >= 0
			p = point_owner_at(@x + 1, @y - 1)
			if (p.present? && p == @player)
				total += 1
				if @x + 2 <= @right_bound && @y - 2 >= 0
					p = point_owner_at(@x + 2, @y - 2)
					if (p.present? && p == @player)
				 		total += 1
					end
					if @x + 3 <= @right_bound && @y - 3 >= 0
						p = point_owner_at(@x + 3, @y - 3)
						if (p.present? && p == @player)
				 			total += 1
						end
					end
				end
			end
		end
		return total
	end

	private

		def point_owner_at(x, y)
			@board.points.where(x_coord: x).where(y_coord: y).first.player
		end 

end