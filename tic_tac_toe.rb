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

  def check_game_status(active_player_piece)
    return check_victory(active_player_piece) || check_draw(active_player_piece)

  end

  def check_victory(active_player_piece)
    #p 'game is won'
  end

  def check_draw(active_player_piece)
    if @board_array.none? { |n| n.is_a? Numeric}
      p 'game has come to a draw'
      return true
    else
      return false
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


    def play()
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

        break if @board.check_game_status(whois_active_player?) == true

        puts "It is now #{whois_active_player?}'s turn"

      end
      p 'reached end of play()'
    end
  end

  def whois_active_player?
    @players_array.each do |player|
      player.active == true ? (return player.piece) : next
    end
  end
end

new_game = Game.new
new_game.play
