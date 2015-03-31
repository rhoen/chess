class Board

  def initialize()
    @squares = Array.new(8) { Array.new(8) }
  end

  def display

  end

  def move(start, end_pos)
    raise
  rescue
    puts "Piece cannot move to that location!"
  end

  def in_check?(color)
    # 1. find position of king on board
    # 2. see if opposing piece can move to that position
  end

end
