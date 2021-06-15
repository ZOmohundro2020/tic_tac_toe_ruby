class Board
  attr_reader :board_array

  def initialize
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts "#{@board_array[6]} | #{@board_array[7]} | #{@board_array[8]}"
    puts '--+---+--'
    puts "#{@board_array[3]} | #{@board_array[4]} | #{@board_array[5]}"
    puts '--+---+--'
    puts "#{@board_array[0]} | #{@board_array[1]} | #{@board_array[2]}"
    puts
  end

  def is_occupied?(input)
    p 'is occupied?'
    p "input is #{input}"
    p "@board_array at input is #{@board_array[input-1]}"
    if @board_array[input-1] == "X" or @board_array[input-1] == "O"
      p "it's x or o"
      return "occupied"
    else
      p @board_array[input - 1]
      return @board_array[input - 1]
    end
  end

end

class Player
  attr_reader :name, :piece, :active

  def initialize(name, piece, active)
    @name = name
    @piece = piece
    @active = active
  end

  def active_toggle()
    @active = !@active
  end

end


class Game
  def initialize()

    @board = Board.new

    @player1 = Player.new('Player1', 'X', true)
    @player2 = Player.new('Player2', 'O', false)

    @players_array = [@player1, @player2]

    

    puts "\nWelcome to tic-tac-toe"
    puts "#{@player1.name} will start and their piece is '#{@player1.piece}'"
    puts

    @board.print_board
  

    while true
      puts 'Enter a number'
      user_input = gets.chomp
      check_occupied = @board.is_occupied?(user_input.to_i)

      if check_occupied == "occupied"
        p "Sorry, that space is occupied"
      else 
        @board.board_array[check_occupied - 1] = "X"
      end

      puts
      @board.print_board

    end
  end

  def whois_active_player?
    @players_array.each do |player|
      player.active == true ? (return player.piece) : next
    end
  end
end

new_game = Game.new
new_game
