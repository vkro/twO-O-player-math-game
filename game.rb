require "./player.rb"

class Game

  attr_accessor :players, :player1, :player2, :current_player, :current_question

  def initialize
    @players = []
    @current_question = []
  end

  def are_lives_gone
    players.any? {|player| player.lives == 0}
  end

  def set_question 
    num1 = rand(21)
    num2 = rand(21)
    @current_question = [num1, num2]
  end

  def evaluate_answer(answer)
    answer.to_i == (current_question[0] + current_question[1])
  end

  def success(index)
    puts "YES! You are correct."
  end

  def failure(index)
    players[index].lose_life()
    puts "Seriously?! No."
  end
 
  def ask_question(index)
    set_question()
    puts "#{players[index].name}, what does #{current_question[0]} plus #{current_question[1]} equal?"
    print "> "
    evaluate_answer(gets.chomp) ? success(index) : failure(index)
    puts "#{players[0].name}: #{players[0].lives}/3  VS  #{players[1].name}: #{players[1].lives}/3"
  end

  def determine_winner
    @players.find_index{|player| player.lives > 0}
  end

  def game_over
    winner_index = determine_winner()
    puts "---------- Game Over ----------\n#{players[winner_index].name} wins with a score of #{players[winner_index].lives}/3!\n-------------------------------\nGoodbye!"
  end

  def run_questions
    first_time = true
    until are_lives_gone()
      players.each.with_index do |player, index|
        if (are_lives_gone)
          break
        else
          puts first_time == true ? "Here's your first question:" : "--------- NEW TURN ---------"
          first_time = false
          ask_question(index)
        end
      end
    end
    game_over
  end

  def start_game
    puts "Welcome to twO-O player math game! Who will be the first player to join the game?"
    player1 = Player.new(gets.chomp)
    puts "Thanks for joining the game, #{player1.name}! Who else is playing?"
    player2 = Player.new(gets.chomp)
    @players = [player1, player2]
    @current_player = players[0]
    puts "Thanks for joining the game, #{players[1].name}! Let's get started... \n#{players[0].name}, you're up first."
    run_questions()
  end

end