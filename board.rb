require "colorize"

class Board

  attr_reader :squares

  def initialize()
    @squares = Array.new(8) { Array.new(8) }
  end

  def square_color(is_white)
    is_white ? :white : :light_black
  end

  def display
    is_white = true

    display_string = "\n"
    @squares.each_with_index do |row, row_num|
      row.each_with_index do |piece, col_num|

        color = square_color(is_white)

        if piece
          display_string << colored_square(piece.display, color)
        else
          display_string << colored_square("  ", color)
        end

        is_white = !is_white
      end
      is_white = !is_white
      display_string << "\n"
    end

    display_string
  end


  def colored_square(string, color)
    string.colorize(:background => color)
  end

  def move(start, end_pos)
    raise
  rescue
    puts "Piece cannot move to that location!"
  end

  def size
    @squares.length
  end

  def in_check?(color)
    # 1. find position of king on board
    # 2. see if opposing piece can move to that position
  end

  def [](pos)
    # p pos
    row, col = pos
    @squares[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @squares[row][col] = piece
  end

end
