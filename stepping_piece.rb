require_relative "piece"

class SteppingPiece < Piece

  def moves
    available_moves = []
    deltas.each do |delta|
      next_move = [self.position[0] + delta[0], self.position[1] + delta[1]]
      unless off_board?(next_move) || !available_square?(next_move)
        available_moves << next_move
      end
    end
    available_moves
  end

end

class Knight < SteppingPiece
  def deltas
    [[1, 2], [1, -2], [-1, -2], [-1, 2],
    [2, 1], [-2, 1], [-2, -1], [2, -1]]
  end
end

class King < SteppingPiece
  def deltas
    [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end
end
