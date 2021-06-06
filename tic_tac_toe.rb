class Board

  def initialize(row1,row2,row3)
    @row1 = row1
    @row2 = row2
    @row3 = row3
  end

  def print_board
    puts "#{@row1.slot1} | #{@row1.slot2} | #{@row1.slot3}"
    puts "--+---+--"
    puts "#{@row2.slot1} | #{@row2.slot2} | #{@row2.slot3}"
    puts "--+---+--"
    puts "#{@row3.slot1} | #{@row3.slot2} | #{@row3.slot3}"
    puts
  end

end

class Row
  attr_accessor :slot1, :slot2, :slot3
  
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
  mid_row = Row.new([4, 5, 6])
  bot_row = Row.new([1, 2, 3])
  board = Board.new(top_row,mid_row,bot_row)

  player1 = Player.new('Player1', 'X')
  player2 = Player.new('Player2', 'O')

  puts "\nWelcome to tic-tac-toe"
  puts "#{player1.name} will start and their piece is '#{player1.piece}'"
  puts

  board.print_board

end

main
