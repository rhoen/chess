module ChessHelper

  def opposite_color(color)
    color == :white ? :black : :white
  end

end
