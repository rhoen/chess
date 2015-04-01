require 'byebug'
require "colorize"
require_relative "stepping_piece"
require_relative "sliding_piece"
require_relative "pawn"

class Board

  attr_reader :squares, :turn

  def initialize()
    @squares = Array.new(8) { Array.new(8) }
    @turn = :white
  end

  def square_color(is_white)
    is_white ? :white : :light_black
  end

  def render
    is_white = true

    display_string = "\n"
    @squares.each_with_index do |row, row_num|
      row.each_with_index do |piece, col_num|

        color = square_color(is_white)

        if piece
          display_string << colored_square(piece.render, color)
        else
          display_string << colored_square("  ", color)
        end

        is_white = !is_white
      end
      is_white = !is_white
      display_string << "\n"
    end

    display_string << "\n"
    display_string
  end

  def colored_square(string, color)
    string.colorize(:background => color)
  end

  def move(start, end_pos)
    piece = self[start]
    available_moves = self[start].moves
    raise if !available_moves.include?(end_pos)
    piece.move_to(end_pos)
  rescue
    puts "Piece cannot move to that location!"
  end

  def size
    @squares.length
  end

  def in_check?(color)
    king = @squares.flatten.find do |piece|
      piece.is_a?(King) && piece.color == color
    end

    opposing_pieces = @squares.flatten.select do |square|
      square.color == opposite_color(color) unless square.nil?
    end

    all_available_moves = []
    opposing_pieces.each do |piece|
      all_available_moves.concat(piece.moves)
    end

    all_available_moves.include?(king.position)
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

  def opposite_color(color)
    color == :white ? :black : :white
  end

end
