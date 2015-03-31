class Piece
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def moves
    raise NotImplementedError
  end

  protected
  attr_reader :board
end
