# What can we add to the Bingo class to allow it to inherit the play method from the Game class?
# We can make the Bingo class a sub class of Game and inherit the play method

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
