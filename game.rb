require "./player.rb"

class Game

  attr_accessor :players, :player1, :player2, :current_player, :current_question

  def initialize
    @player1 = ""
    @player2 = ""
    @players = [@player1, @player2]
    @current_player = @player1
    @current_question = []
    @game_active = true
  end

  def set_question 
    num1 = rand(21)
    num2 = rand(21)
    @current_question = [num1, num2]
  end

  def are_lives_gone
    players.any? {|player| player.lives == 0}
  end
 
  def ask_question
    set_question()
    puts "What does #{current_question[0]} plus #{current_question[1]} equal?"
    print "> "
    evaluate_answer(gets.chomp)
  end
  
  def run_questions
    until are_lives_gone()
      players.each do |player, index|
        ask_question()
        next_turn()
      end
    end
    game_over()
  end

  def start_game
    puts "Welcome to twO-O player math game! Who will be the first player to join the game?"
    player1 = Player.new(gets.chomp)
    puts "Thanks for joining the game, #{player1.name}? Who else is playing?"
    player2 = Player.new(gets.chomp)
    @players = [player1, player2]
    
    puts "Thanks for joining the game, #{players[0].name}! Let's get started! \n#{players[1].name}, you're up first.\nHere's your first question:"
  end

end


def create_game
  game = Game.new
end

game = Game.new()

game.start_game