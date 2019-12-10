require "./player.rb"

class Game

  attr_accessor :players, :score, :status

  puts "Welcome to twO-O player math game! Who will be the first player to join the game?"
  name1 = gets.chomp
  player1 = Player.new(name1)
  puts "Thanks for joining the game, #{player1.name}? Who else is playing?"
  name2 = gets.chomp
  player2 = Player.new(name2)
  puts "Thanks for joining the game, #{player2.name}! Let's get started! \n#{player1.name}, you're up first. Here's the first question:"


end


game = Game.new