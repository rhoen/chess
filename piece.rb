#coding: utf-8

require_relative 'array_helper'

class Piece

  attr_accessor :color, :position, :board

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  #move into board class
  def on_board?(pos)
    pos.all? { |el| el.between?(0, @board.size - 1) }
  end

  def empty_square?(next_move)
    @board[next_move].nil?
  end

  def opponent?(other_piece)
    other_piece.color != self.color
  end

  def available_square?(pos)
    on_board?(pos) && (@board[pos].nil? || @board[pos].color != self.color)
  end
  #end move into board class

  def move_to(end_pos)
    @board[end_pos] = self
    @board[self.position] = nil
    self.position = end_pos
  end

  def move_into_check?(pos)
    new_board = @board.dup
    new_board.move!(self.position, pos)
    new_board.in_check?(self.color)
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end

  def dup_with_board(board)
    self.class.new(self.color, board, self.position)
  end

  def piece_color
    @color == :white ? :black : :black
  end

  def colorize_piece(str)
    str.colorize(piece_color)
  end

  def render
    colorize_piece(character[self.color] + " ")
  end

end
