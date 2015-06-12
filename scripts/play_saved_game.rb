require_relative "../chess_game"
load "chess_game.rb"
p1 = HumanPlayer.new(:white)
p2 = HumanPlayer.new(:black)
board = ChessGame.load("game_saves/pawn_accross_board.yaml")

game = ChessGame.new(board, p1, p2)
puts board.render
game.run


/Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:115:in `[]': undefined method `[]' for nil:NilClass (NoMethodError)
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/piece.rb:21:in `empty_square?'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/pawn.rb:20:in `block in moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/pawn.rb:18:in `each'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/pawn.rb:18:in `moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:101:in `block in all_available_moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:97:in `each'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:97:in `all_available_moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:81:in `in_check?'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/piece.rb:48:in `move_into_check?'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/piece.rb:52:in `block in valid_moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/piece.rb:52:in `reject'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/pieces/piece.rb:52:in `valid_moves'
	from /Users/rhoen/Dropbox/Ruby/chess/lib/board.rb:56:in `move'
	from chess_game.rb:46:in `run'
