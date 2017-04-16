require 'rails_helper'

RSpec.describe BoardAnalyzer do
  	let!(:player) { FactoryGirl.create(:player) }
  	let!(:board) { FactoryGirl.create(:board) }

  	describe '#check_for_horizontal_winner' do

  		context 'no instance of 4 in a row' do 
  			it 'returns false' do 
  				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
	  			expect(board_analyzer.horizontal_winning_position?).to_not be
  			end
  		end

  		context 'new point is 4th in a row on right' do
  			it 'returns true if p_1 point is in 4 in a row horizontally on right end' do
  				set_four_horizontal_from_left
  				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
	  			expect(board_analyzer.horizontal_winning_position?).to be
  			end
  		end

  		context 'new point is 4th in a row on left' do
	  		it 'returns true if p_1 point is in 4 in a row horizontally on left end' do
	  			set_four_horizontal_from_right
				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
	  			expect(board_analyzer.horizontal_winning_position?).to be
	  		end
  		end

  		context 'new point is 4th is second from right of 4 in a row' do
	  		it 'returns true if p_1 point is in 4 in a row horizontally on left end' do
	  			set_four_non_contiguosly
				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
	  			expect(board_analyzer.horizontal_winning_position?).to be
	  		end
  		end
  	end

  	describe '#check_vertical_winner' do
  		context 'point is placed in row index=2 or lower' do

  			it 'returns false' do 
  				set_points_vertically_in_rows_0_to_2
  				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  				expect(board_analyzer.vertical_winning_position?).to_not be
  			end
  		end

  		context 'pieces are set up 4 in a row vertically' do

  			it 'returns true' do 
  				set_points_vertically_in_row_0_to_3
  				board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  				expect(board_analyzer.vertical_winning_position?).to be
  			end
  		end
  	end

  	describe '#check_diagonal_winner' do
		it 'returns true if p_1 point is in 4 in a row diagonally from nw to se' do
			set_4_points_diagonally_from_nw_to_se
			board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  			expect(board_analyzer.diagonal_winning_position?).to be
		end

		it 'returns true if p_1 point is in 4 in a row diagonally from nw to se but last placed in middle' do
			set_4_points_diagonally_from_nw_to_se_with_middle_point_last
			board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  			expect(board_analyzer.diagonal_winning_position?).to be
		end

		it 'returns true if p_1 point is in 4 in a row diagonally from ne to sw' do
			set_4_points_diagonally_from_ne_to_sw
			board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  			expect(board_analyzer.diagonal_winning_position?).to be
		end

		it 'returns true if p_1 point is in 4 in a row diagonally from ne to sw but last placed in middle' do
			set_4_points_diagonally_from_ne_to_sw_with_middle_point_last
			board_analyzer = BoardAnalyzer.new(board, board.new_valid_point, player)
  			expect(board_analyzer.diagonal_winning_position?).to be
		end
  	end
	

	def set_fewer_than_seven_points
		(0..6).each do |x, i|
			set_x_coord_point(x)
		end
	end

	def set_four_horizontal_from_left
		(0..3).each do |x|
			set_x_coord_point(x)
		end
	end

	def set_four_horizontal_from_right
		r = 3..0
		(r.first).downto(r.last).each.each do |x|
			set_x_coord_point(x)
		end
	end

	def set_four_non_contiguosly
		set_x_coord_point(0)
		set_x_coord_point(1)
		set_x_coord_point(3)
		set_x_coord_point(2)
	end

	def set_points_vertically_in_rows_0_to_2
		(0..2).each do |y|
			set_y_coord_point(y)
		end
	end

	def set_points_vertically_in_row_0_to_3
		(0..3).each do |y|
			set_y_coord_point(y)
		end
	end

	def set_4_points_diagonally_from_nw_to_se
		set_x_and_y_coord_point(0,0)
		set_x_and_y_coord_point(1,1)
		set_x_and_y_coord_point(2,2)
		set_x_and_y_coord_point(3,3)
	end

	def set_4_points_diagonally_from_nw_to_se_with_middle_point_last
		set_x_and_y_coord_point(0,0)
		set_x_and_y_coord_point(1,1)
		set_x_and_y_coord_point(3,3)
		set_x_and_y_coord_point(2,2)
	end

	def set_4_points_diagonally_from_ne_to_sw
		set_x_and_y_coord_point(3,3)
		set_x_and_y_coord_point(2,2)
		set_x_and_y_coord_point(1,1)
		set_x_and_y_coord_point(0,0)
	end

	def set_4_points_diagonally_from_ne_to_sw_with_middle_point_last
		set_x_and_y_coord_point(3,3)
		set_x_and_y_coord_point(2,2)
		set_x_and_y_coord_point(0,0)
		set_x_and_y_coord_point(1,1)
	end

	def set_x_coord_point(x)
		point = board.points.where(x_coord: x).where(y_coord: 0).first
		point.player_1!
		point.update_attribute(:player, player)
	end

	def set_y_coord_point(y)
		point = board.points.where(x_coord: 0).where(y_coord: y).first
		point.player_1!
		point.update_attribute(:player, player)
	end

	def set_x_and_y_coord_point(x,y)
		point = board.points.where(x_coord: x).where(y_coord: y).first
		point.player_1!
		point.update_attribute(:player, player)
	end


end