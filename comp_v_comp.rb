require_relative "chess_game"
white_wins = 0;
black_wins = 0;
10.times do
  p1 = ComputerPlayer.new(:white)
  p2 = ComputerPlayer.new(:black)
  board = ChessGame.default
  game = ChessGame.new(board, p1, p2)

  winner = game.run
  winner == :white ? white_wins += 1 : black_wins += 1
end
puts "white_wins: #{white_wins}"
puts "black_wins: #{black_wins}"
