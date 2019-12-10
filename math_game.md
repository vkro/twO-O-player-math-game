# Two-O-Player Math Game

## Possible Classes

### Player
Player plays the game, inputs answers to questions, wins or loses.
  * State:
      * name
      * score
      * lives

  * Behaviour
      * answer questions

### Game
Game tracks status of the game - who are the players, how many players are in the game, whose turn is it, what is the score, what are the questions and their answers, is the game ongoing or has it ended.

Game presents questions to the players, accepts answers, returns result of answer evaluation, adjusts the score and lives of players, .

  * State:
    * players
    * score
    * questions (w/ their answers)
    * current question
    * current player (whose turn)
    * player answer
    * status - active or ended
  * Behaviour
    * present questions to players
    * change turns (iterate over players)
    * receive and evaluate answers to questions
    * update game score
    * update players' lives
    * announces game outcome at conclusion of current game
    * end game

