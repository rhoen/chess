require 'dispel'
require_relative 'board'
require 'yaml'

class ChessGame

  def self.play
  end

  def self.load
    YAML.load_file(file_path_name)
  end

  def initialize(board = YAML.load_file('starting_positions.yaml'))
    @board = board
  end

  def run
    puts @board.render
  end

  def load(file_path_name)
    @board = ChessGame.load(file_path_name)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = ChessGame.new
  game.run
end
