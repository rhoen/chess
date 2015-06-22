require 'byebug'
require "colorize"
require_relative "pieces/stepping_piece"
require_relative "pieces/sliding_piece"
require_relative "pieces/pawn"
require_relative 'chess_helper'

class Board
  include ChessHelper

  attr_reader :squares
  attr_accessor :moves_since_capture
  def initialize()
    @squares = Array.new(8) { Array.new(8) }
    @moves_since_capture = 0
  end


  def square_color(is_white)
    is_white ? :white : :light_black
  end

  def render
    is_white = true

    display_string = "\n"
    @squares.each_with_index do |row, row_num|
      display_string << (8 - row_num).to_s
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

    display_string << " A B C D E F G H\n\n"
    display_string
  end

  def colored_square(string, color)
    string.colorize(:background => color)
  end

  # refactor move and move! like all_available_moves
  def move(start, end_pos)
    piece = self[start]
    available_moves = piece.valid_moves
    byebug
    raise MoveNotAvailableError unless available_moves.include?(end_pos)
    piece.move_to(end_pos)
  rescue MoveNotAvailableError => e
    puts "Piece cannot move to that location!"
    raise e
  end

  def move!(start, end_pos)
    piece = self[start]
    available_moves = self[start].moves
    raise if !available_moves.include?(end_pos)
    piece.move_to(end_pos)
  rescue
    puts "Piece cannot move to that location!"
    raise
  end

  def size
    @squares.length
  end

  def in_check?(color)
    king = find_king(color)
    opposing_pieces = find_all_pieces(opposite_color(color))
    all_available_moves(opposing_pieces).include?(king.position)
  end

  def checkmate?(color)
    player_pieces = find_all_pieces(color)
    in_check?(color) && all_available_moves(player_pieces, :valid).empty?
  end

  def find_king(color)
    @squares.flatten.find do |piece|
      piece.is_a?(King) && piece.color == color
    end
  end

  def all_available_moves(pieces, validity = nil)
    all_available_moves = []
    pieces.each do |piece|
      if validity == :valid
        all_available_moves.concat(piece.valid_moves)
      else
        all_available_moves.concat(piece.moves)
      end
    end
    all_available_moves
  end

  def find_all_pieces(color)
    @squares.flatten.select do |square|
      square.color == color unless square.nil?
    end
  end

  def fortressed?(color)
    if all_available_moves(find_all_pieces(color), :valid).count == 0
      true
    else
      false
    end
  end

  def [](pos)
    row, col = pos
    @squares[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @squares[row][col] = piece
  end

  def dup
    new_board = Board.new

    pieces = @squares.flatten.select {|piece| piece}

    pieces.each do |piece|
      new_board[piece.position] = piece.dup_with_board(new_board)
    end

    new_board
  end

  def save
    File.write('game_saves/auto_saved_game.yaml', self.to_yaml)
  end

end
