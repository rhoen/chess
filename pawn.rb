require_relative "stepping_piece"

class Pawn < SteppingPiece

  def initialize(color, board, position)
    @original_square = position
    super
  end

  def on_original_square?
    @original_square == @position
  end

  #TODO jumps over pieces and captures pieces in front,  very rude pawn
  def moves

    available_moves = []

    deltas.each do |delta|
      next_move = [self.position[0] + delta[0], self.position[1] + delta[1]]
      break if !empty_square?(next_move)
      unless off_board?(next_move)
        available_moves << next_move
      end
    end



    available_moves + capture_moves
  end

  def deltas
    deltas = {}
    if on_original_square?
      deltas = {:white => [[-1, 0], [-2, 0]],
                    :black => [[1,0], [2, 0]]}
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
      next_move = [self.position[0] + delta[0], self.position[1] + delta[1]]
      available_moves << next_move if @board[next_move] &&
                                     opponent?(@board[next_move])
    end

    available_moves
  end

  def empty_square?(next_move)
    @board[next_move].nil?
  end

end
