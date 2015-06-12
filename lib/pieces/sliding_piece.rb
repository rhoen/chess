require_relative "piece"

class SlidingPiece < Piece

  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  ORTHOGONAL_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    available_moves = []

    move_dirs.each do |dir|
      last_move = self.position
      loop do
        next_move = last_move.zip_sum(dir)
        break unless available_square?(next_move)
        break if @board[last_move] && opponent?(@board[last_move])
        available_moves << next_move
        last_move = next_move
      end
    end

    available_moves
  end

end

class Bishop < SlidingPiece

  def move_dirs
    DIAGONAL_DIRS
  end

  def character
    {white: "♗", black: "♝"}
  end

end

class Rook < SlidingPiece

  def move_dirs
    ORTHOGONAL_DIRS
  end

  def character
    {white: "♖", black: "♜"}
  end

end

class Queen < SlidingPiece

  def move_dirs
    DIAGONAL_DIRS + ORTHOGONAL_DIRS
  end

  def character
    {white: "♕", black: "♛"}
  end

end
