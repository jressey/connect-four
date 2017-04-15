class Point < ApplicationRecord
  belongs_to :board
  belongs_to :player

  enum state: [:valid_move, :invalid_move, :player_1, :player_2]
end
