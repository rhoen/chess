require_relative "../chess_game"
load "chess_game.rb"
p1 = HumanPlayer.new(:white)
p2 = HumanPlayer.new(:black)
board = ChessGame.load("game_saves/pawn_accross_board.yaml")
game = ChessGame.new(board, p1, p2)
puts board.render
game.run
