require 'byebug'

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
    @position = position
  end

  def moves
    raise NotImplementedError
  end

  def display
    PIECES[color][self.class.to_s.downcase.to_sym] + " "
  end

  def off_board?(pos)
    !pos.all? { |el| el.between?(0, @board.size - 1) }
  end

  def available_square?(pos)
    (@board[pos].nil? || @board[pos].color != self.color) ||
    pos == self.position
  end

  protected
  attr_reader :board
  attr_writer :position
end

class SlidingPiece < Piece

  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  ORTHOGONAL_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    available_moves = [self.position]
    last_move = available_moves.last

    move_dirs.each do |dir|

      # until off_board?(last_move) || !available_square?(last_move)
      #   break if @board[last_move] && @board[last_move].color != self.color
      #   available_moves << [last_move[0] + dir[0], last_move[1] + dir[1]]
      #   last_move = available_moves.last
      # end

      loop do
        last_move = available_moves.last
        byebug
        next_move = [last_move[0] + dir[0], last_move[1] + dir[1]]

        break if off_board?(next_move)
        break if !available_square?(next_move)
        break if @board[last_move] && @board[last_move].color != self.color

        available_moves << next_move

      end

      available_moves << [self.position]
    end

    available_moves.delete([self.position])

    available_moves
  end

  def move_dirs
    raise NotImplementedError
  end

end

class Bishop < SlidingPiece

  def move_dirs
    DIAGONAL_DIRS
  end
end

class Rook < SlidingPiece
  def move_dirs
    ORTHOGONAL_DIRS
  end
end

class Queen < SlidingPiece
  def move_dirs
    DIAGONAL_DIRS + ORTHOGONAL_DIRS
  end
end

class SteppingPiece < Piece

end

class Knight < SteppingPiece

end

class King < SteppingPiece

end

class Pawn < Piece

end
