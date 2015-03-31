class Board

  SQUARES = {black: "  ".colorize(:background => :black),
    white: "  ".colorize(:background => :white)}

  def initialize()
    @squares = Array.new(8) { Array.new(8) }
  end

  def display
    is_white = true

    display_string = "\n"
    @squares.each_with_index do |row, row_num|
      row.each_with_index do |piece, col_num|

        if piece
          display_string << piece.display.colorize(
          :background => square_color(is_white))
        else
          display_string << SQUARES[square_color(is_white)]
        end

        is_white = !is_white
      end
      is_white = !is_white
      display_string << "\n"
    end

    display_string
  end

  def square_color(is_white)
    is_white ? :white : :black
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
