class Board
  @@state = 'Player1'
  def display_state
    puts
    puts "1 | 2 | 3 "
  end
end

class Row
  def initialize(values_array)
    #@slot1 = values_array[0]
    #@slot2 = values_array[1]
    #@slot3 = values_array[2]
    p "@slot1 is #{@slot1}"
    
    
  end
  def display_values
    # p @slot1
    #values_array
    puts "test"
  end

end

class Player
  attr_reader :name, :piece
  def initialize(name,piece)
    @name = name
    @piece = piece
  end
end




def main()
  board = Board.new()
  row1 = [7,8,9]
  
  player1 = Player.new("Player1","X")
  player2 = Player.new("Player2","O")


  puts "\nWelcome to tic-tac-toe"
  puts "#{player1.name} will start and their piece is '#{player1.piece}'"

  board.display_state
  p row1.display_values()

end

main()