require_relative "piece"

class Pawn < Piece

  def initialize(color, board, position)
    @original_square = position
    super
  end

  def on_original_square?
    @original_square == @position
  end

  def move(pos)
    available_moves = []
    if on_original_square
  end

  def standard_moves
    deltas = {:white => [[-1,-1], [-1, 0], [-1,1]],
              :black => [[1, -1], [1,0], [1, 1]]}
    deltas[self.color].
  end


end
