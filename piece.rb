class Piece

  PIECES = {
    :white => {
      king:	 "\u2654", #♔
      queen: "\u2655", #♕
      rook:  "\u2656", #♖
      bishop:"\u2657", #♗
      knight:"\u2658", #♘
      pawn:  "\u2659"  #♙
  },

    :black => {
      king:	 "\u265A", #♔
      queen: "\u265B", #♕
      rook:  "\u265C", #♖
      bishop:"\u265D", #♗
      knight:"\u265E", #♘
      pawn:  "\u265F"  #♙
    }
  }

  attr_reader :color, :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @postion = position
  end

  def moves
    raise NotImplementedError
  end

  def display
    PIECES[color][self.class.to_s.downcase.to_sym]
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
