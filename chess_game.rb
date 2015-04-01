require 'dispel'
require_relative 'board'
require_relative 'chess_helper'
require 'yaml'
require_relative 'error'

class ChessGame

  include ChessHelper

  def self.play
  end

  def self.load
    YAML.load_file(file_path_name)
  end

  def self.default
    YAML.load_file('starting_positions.yaml'
  end

  def initialize(board, white_player, black_player)
    @board = board
    @turn = :white
    @white_player = white_player
    @black_player = black_player
  end

  def run
    until @board.checkmate?(@turn)
      puts @board.render
      begin
        from, to = get_player_input
        raise NotYourPieceError if @board[from].color != @turn
        @board.move(from, to)
      rescue NotYourPieceError => e
        puts "That is not your piece."
        retry
      rescue MoveNotAvailableError => e
        retry
      end
      @turn = opposite_color(@turn)
    end

    puts @board.render

    puts "Checkmate!"
  end

  def get_player_input
    current_player.play_turn
  end

  def current_player
    @turn == :white ? @white_player : @black_player
  end

  def load(file_path_name)
    @board = ChessGame.load(file_path_name)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = ChessGame.new
  game.run
end
