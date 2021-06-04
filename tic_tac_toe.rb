class Board
  @@state = 'Player1'
end

class Player
  attr_reader :name, :piece
  def initialize(name,piece)
    @name = name
    @piece = piece
  end
end

player1 = Player.new("Player1","X")
player2 = Player.new("Player2","O")

p player1.name
p player1