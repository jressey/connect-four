require 'rails_helper'

RSpec.describe BoardAnalyzer do
  	
  	describe '#check_if_point_is_winner' do
  		
  		context "board with fewer than 7 points" do 
  			board = Board.create()
  			player = Player.new()
  			before {
  				(0..6).each do |x, i|
  					point = board.points.where(x_coord: x).where(y_coord: 0).first
  					if x.even? 
  						point.player_1!
  					else
  						point.player_2!
  					end
  				end
  			}
	  		it 'should return false if there are fewer than 7 points on the board' do
	  			board_analyzer = BoardAnalyzer.new(board, board.latest_point, player)
	  			expect(board_analyzer.check_if_point_is_winner).to_not be
	  		end  		
  		end
  	end

  	describe "#check_for_horizontal_winner" do

  		context "new point is 4th in a row on right" do
  			board = Board.create()
  			player = Player.create()
  			before {
  				(0..3).each do |x|
  					point = board.points.where(x_coord: x).where(y_coord: 0).first
  					point.player_1!
  					point.update_attribute(:player, player)
  				end
  			}
  			it 'should return true if p_1 point is in 4 in a row horizontally on right end' do
  				board_analyzer = BoardAnalyzer.new(board, board.latest_point, player)
	  			expect(board_analyzer.check_for_horizontal_winner).to be
  			end
  		end

  		context "new point is 4th in a row on left" do
  			board = Board.create()
  			player = Player.create()
  			before {
  				r = 3..0
  				(r.first).downto(r.last).each.each do |x|
  					point = board.points.where(x_coord: x).where(y_coord: 0).first
  					point.player_1!
  					point.update_attribute(:player, player)
  				end
  			}
	  		it 'should return true if p_1 point is in 4 in a row horizontally on left end' do
				board_analyzer = BoardAnalyzer.new(board, board.latest_point, player)
	  			expect(board_analyzer.check_for_horizontal_winner).to be
	  		end
  		end

  		context "new point is 4th is second from right of 4 in a row" do
  			board = Board.create()
  			player = Player.create()
  			before {
  				point = board.points.where(x_coord: 0).where(y_coord: 0).first
  				point.player_1!
  				point.update_attribute(:player, player)
  				point = board.points.where(x_coord: 1).where(y_coord: 0).first
  				point.player_1!
  				point.update_attribute(:player, player)
  				point = board.points.where(x_coord: 3).where(y_coord: 0).first
  				point.player_1!
  				point.update_attribute(:player, player)
  				point = board.points.where(x_coord: 2).where(y_coord: 0).first
  				point.player_1!
  				point.update_attribute(:player, player)
  	
  			}
	  		it 'should return true if p_1 point is in 4 in a row horizontally on left end' do
				board_analyzer = BoardAnalyzer.new(board, board.latest_point, player)
	  			expect(board_analyzer.check_for_horizontal_winner).to be
	  		end
  		end
  	end

  	describe "#check_vertical_winner" do
  	end

  	describe "#check_diagonal_winner" do
  	end
	it 'should return true if p_1 point is in 4 in a row horizontally when last point is placed between existing points' do
	end
	it 'should return true if p_1 point is in 4 in a row diagonally from nw to se' do
	end
	it 'should return false if none of positive cases are satisfied' do
	end
end