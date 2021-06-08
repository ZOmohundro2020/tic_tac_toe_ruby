class Board

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

  def check_input(user_input)
    #p "user_input is #{user_input}"

    @board_array.each_with_index do |num, i|
      #p "num is #{num}"
      #p "i is #{i}"

      next unless num.to_s == user_input

      #puts "Match on #{user_input}"
      @board_array[i] = 'X'

      break
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
      check_active_player
      @player1.active_toggle
      @player2.active_toggle
      check_active_player
      puts 'Enter a number'
      user_input = gets.chomp
      @board.check_input(user_input)
      puts
      @board.print_board
    end
  end

  def check_active_player
    @players_array.each do |player|
      puts "#{player.name}: #{player.active}"
    end
  end
end

new_game = Game.new
new_game
