require 'dispel'
require_relative 'board'

class ChessGame

  def self.play
  end

  def initialize(board = Board.new)
    @board = board
  end

  def run
    Dispel::Screen.open do |screen|
      string = "Hello world"
      screen.draw draw(string)

      Dispel::Keyboard.output do |key|
        case key
        when :up then move_cursor(0, -1)
        when :down then move_cursor(0, 1)
        when :left then move_cursor(-1, 0)
        when :right then move_cursor(1, 0)
        when "q" then break
        end
        screen.draw draw(string)
      end
    end
  end

  def draw(str)
    str
  end

  def move_cursor

  end


end
