require_relative "chess_helper"

class Player
  include ChessHelper

  attr_reader :color, :available_move_count

  def initialize(color)
    @color = color
  end

  def available_move_count

  end

end

class HumanPlayer < Player

  def play_turn(board) #board is for computer, human can see render
    puts "Enter move from, move to: "
    input = gets.chomp
    parse(input)
  end

  def parse(input)
    return input if input.downcase == "save"
    from_pos, to_pos = input.split(" ")
    from_pos = [num_to_row(from_pos[1]), char_to_col(from_pos[0])]
    to_pos = [num_to_row(to_pos[1]), char_to_col(to_pos[0])]
    [from_pos, to_pos]
  end

  def char_to_col(char)
    char.downcase.ord - "a".ord
  end

  def num_to_row(num)
    8 - num.to_i
  end

end

class ComputerPlayer < Player

  def play_turn(board)
    smarter_move(board)
  end

  def random_move(board)
    piece = board.find_all_pieces(self.color).sample
    moves = board.all_available_moves([piece], :valid)
    raise if moves.empty?
    [piece.position, moves.sample]
  rescue
    retry
  end

  def smarter_move(board)
    pieces = board.find_all_pieces(self.color)
    pieces.each do |piece|
      moves = board.all_available_moves([piece], :valid)
      captures = capture_moves(moves, board)
      return [piece.position, moves.sample] unless captures.empty?
      # safety = safe_moves(moves)

    end

    random_move(board)
  end

  def capture_moves(moves, board)
    moves.select do |move|
      board[move].color == opposite_color(color) if board[move]
    end
  end

  def run_away_moves

  end

  def safe_moves(moves)
    moves.select! do |move|
      opposing_pieces = find_all_pieces(opposite_color(color))
      board[move]
    end
  end

end
