class Player

  def initialize(color)
    @color = color
  end

end

class HumanPlayer < Player

  def play_turn
    puts "Enter move from, move to: "
    input = gets.chomp
    parse(input)
  end

  def parse(input)
    return input if input.downcase == "save"
    from_pos, to_pos = input.split(" ")
    from_pos = [num_to_row(from_pos[1]), char_to_col(from_pos[0])]
    to_pos = [num_to_row(to_pos[1]), char_to_col(to_pos[0])]
    [from_pos, to_pos]
  end

  def char_to_col(char)
    char.downcase.ord - "a".ord
  end

  def num_to_row(num)
    8 - num.to_i
  end

end

class ComputerPlayer < Player

end
