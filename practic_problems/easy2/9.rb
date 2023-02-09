class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def play
    'Lets play Bingo!'
  end

  def rules_of_play
    #rules of play
  end
end

bingo = Bingo.new
p bingo.play

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.
# This would overwrite the play method from game when called on an instance of Bingo as the lookup path starts at Bingo and finds the method it is looking for.
