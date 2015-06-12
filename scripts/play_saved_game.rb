require_relative "../chess_game"
p1 = HumanPlayer.new(:white)
p2 = HumanPlayer.new(:black)
board = ChessGame.load("saved_game.yaml")
game = ChessGame.new(board, p1, p2)
puts board.render
game.run
