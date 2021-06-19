# creates a board
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

  def occupied?(input)
    if (@board_array[input - 1] == 'X') || (@board_array[input - 1] == 'O')
      'occupied'
    else
      @board_array[input - 1]
    end
  end

  def check_game_status
    check_victory || check_draw
  end

  def check_victory
    check_vertical ||
    check_horizontal ||
    check_diagonal
  end

  def check_vertical
    column_1 = [board_array[6], board_array[3], board_array[0]]
    column_2 = [board_array[7], board_array[4], board_array[1]]
    column_3 = [board_array[8], board_array[5], board_array[2]]

    if column_1.all? { |n| (n == 'X') || (n == 'O') } ||
       column_2.all? { |n| (n == 'X') || (n == 'O') } ||
       column_3.all? { |n| (n == 'X') || (n == 'O') }
      return true

    end

    false
  end

  def check_horizontal
    false
  end

  def check_diagonal
    false
  end

  def check_draw
    if @board_array.none? { |n| n.is_a? Numeric }
      p 'game has come to a draw'
      true
    else
      false
    end
  end
end

# creates a player
class Player
  attr_reader :name, :piece, :active

  def initialize(name, piece, active)
    @name = name
    @piece = piece
    @active = active
  end

  def active_toggle
    @active = !@active
  end
end

# defines the overall game
class Game
  def initialize
    @board = Board.new

    @player1 = Player.new('Player1', 'X', true)
    @player2 = Player.new('Player2', 'O', false)

    @players_array = [@player1, @player2]

    puts "\nWelcome to tic-tac-toe"
    puts "#{@player1.name} will start and their piece is '#{@player1.piece}'"
    puts

    @board.print_board

    def play
      while true
        puts "Player #{whois_active_player?}, Enter a number (1-9): "

        user_input = gets.chomp
        next unless (user_input.to_i > 0) && (user_input.to_i < 10)

        check_occupied = @board.occupied?(user_input.to_i)

        if check_occupied == 'occupied'
          p 'Sorry, that space is occupied'
        else
          @board.board_array[check_occupied - 1] = whois_active_player?
          @player1.active_toggle
          @player2.active_toggle
        end

        puts

        @board.print_board

        break if @board.check_game_status == true

        puts "It is now #{whois_active_player?}'s turn"

      end

      puts "#{whois_previous_player?} wins!"
      puts
    end
  end

  def whois_active_player?
    @players_array.each do |player|
      player.active == true ? (return player.piece) : next
    end
  end

  def whois_previous_player?
    @players_array.each do |player|
      player.active == false ? (return player.piece) : next
    end
  end
end

new_game = Game.new
new_game.play
