class Piece
  attr_reader :color, :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @postion = position
  end

  def moves
    raise NotImplementedError
  end

  protected
  attr_reader :board
  attr_writer :position
end

class SlidingPiece < Piece

  def move_dirs
    raise NotImplementedError
  end

end

class Bishop < SlidingPiece

end

class Rook < SlidingPiece

end

class Queen < SlidingPiece

end

class SteppingPiece < Piece

end

class Knight < SteppingPiece

end

class King < SteppingPiece

end

class Pawn < Piece

end
