require_relative "stepping_piece"

class Pawn < SteppingPiece

  def initialize(color, board, position, original_square = position)
    @original_square = original_square
    super
  end

  def on_original_square?
    @original_square == @position
  end

  #TODO maybe refactor moves methods using procs?
  def moves
    available_moves = []

    deltas.each do |delta|
      next_move = self.position.zip_sum(delta)
      break unless on_board?(next_move)
      break unless empty_square?(next_move)
      available_moves << next_move
    end

    available_moves + capture_moves
  end

  def deltas

    if on_original_square?
      deltas = {
        :white => [[-1, 0], [-2, 0]],
        :black => [[1,0], [2, 0]]
      }
    else
      deltas = {:white => [[-1, 0]],
                :black => [[1,0]]}
    end

    deltas[self.color]
  end

  def capture_moves
    capture_deltas = {:white => [[-1,-1], [-1,1]],
                     :black => [[1,-1], [1, 1]]}
    available_moves = []
    capture_deltas[self.color].each do |delta|
      next_move = self.position.zip_sum(delta)
      break unless on_board?(next_move)
      if @board[next_move] && opponent?(@board[next_move])
        available_moves << next_move
      end
    end

    available_moves
  end

  def character
    {white: "♙", black: "♟"}
  end

  def dup_with_board(board)
    self.class.new(self.color, board, self.position, @original_square)
  end

end
