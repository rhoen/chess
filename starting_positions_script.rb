require_relative 'board'
require 'yaml'

board = Board.new

(0..7).to_a.each do |col|
  board[[1, col]] = Pawn.new(:black, board, [1, col])
  board[[6, col]] = Pawn.new(:white, board, [6, col])
end

board[[0,0]] = Rook.new(:black, board, [0,0])
board[[0,7]] = Rook.new(:black, board, [0,7])
board[[7,0]] = Rook.new(:white, board, [7,0])
board[[7,7]] = Rook.new(:white, board, [7,7])

board[[0,1]] = Knight.new(:black, board, [0,1])
board[[0,6]] = Knight.new(:black, board, [0,6])
board[[7,1]] = Knight.new(:white, board, [7,1])
board[[7,6]] = Knight.new(:white, board, [7,6])

board[[0,2]] = Bishop.new(:black, board, [0,2])
board[[0,5]] = Bishop.new(:black, board, [0,5])
board[[7,2]] = Bishop.new(:white, board, [7,2])
board[[7,5]] = Bishop.new(:white, board, [7,5])

board[[0,3]] = Queen.new(:black, board, [0,3])
board[[7,3]] = Queen.new(:white, board, [7,3])

board[[0,4]] = King.new(:black, board, [0,4])
board[[7,4]] = King.new(:white, board, [7,4])


File.write('starting_positions.yaml', board.to_yaml)
