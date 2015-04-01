require_relative "piece"

class SteppingPiece < Piece

  def moves
    available_moves = []
    deltas.each do |delta|
      unless off_board?(next_move(delta)) ||
                    !available_square?(next_move(delta))
        available_moves << next_move(delta)
      end
    end
    available_moves
  end

  def next_move(delta)
    [self.position[0] + delta[0], self.position[1] + delta[1]]
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
