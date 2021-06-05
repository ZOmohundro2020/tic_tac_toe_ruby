class Board
  attr_accessor :row

  def initialize(row)
    @row = row
  end

  def print_board
    row
  end
end

class Row
  def initialize(values_array)
    (@slot1, @slot2, @slot3) = values_array
  end

  def display_values
    [@slot1, @slot2, @slot3]
  end
end

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end

def main
  top_row = Row.new([7, 8, 9])
  board = Board.new(top_row)

  player1 = Player.new('Player1', 'X')
  player2 = Player.new('Player2', 'O')

  puts "\nWelcome to tic-tac-toe"
  puts "#{player1.name} will start and their piece is '#{player1.piece}'"

  p board.row
  p top_row.display_values
  p board.print_board
end

main
