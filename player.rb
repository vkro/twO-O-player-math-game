class Player
  
  attr_accessor :name, :lives
  
  def initialize(n)
    @name = n
    @lives = 3
  end

  def lose_life
    @lives -= @lives
  end

end


player1 = Player.new("Vanessa")
player2 = Player.new("Fred")