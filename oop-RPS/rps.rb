class Score
  attr_accessor :score

  MAX_SCORE = 3

  def initialize
    @score = 0
  end

  def increment_score
      @score += 1
  end

  def win?
    self.score >= MAX_SCORE
  end
end

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    if (rock? && other_move.scissors?) ||
       (rock? && other_move.lizard?) ||
       (paper? && other_move.rock?) ||
       (paper? && other_move.spock?) ||
       (scissors? && other_move.paper?) ||
       (scissors? && other_move.lizard?) ||
       (lizard? && other_move.paper?) ||
       (lizard? && other_move.spock?) ||
       (spock? && other_move.rock?) ||
       (spock? && other_move.scissors?)
      return true
    end

    false
  end

  def <(other_move)
    if (rock? && other_move.paper?) ||
       (rock? && other_move.spock?) ||
       (paper? && other_move.scissors?) ||
       (paper? && other_move.lizard?) ||
       (scissors? && other_move.rock?) ||
       (scissors? && other_move.spock?) ||
       (lizard? && other_move.rock?) ||
       (lizard? && other_move.scissors?) ||
       (spock? && other_move.paper?) ||
       (spock? && other_move.lizard?)
      return true
    end

    false
  end

  def to_s
    @value
  end
end

class Player < Score
  attr_accessor :move, :name, :history

  def initialize
    super
    @history = []
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry please enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUES.join(', ')}."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry invalid choice, please enter #{Move::VALUES.join(', ')}"
    end
    self.history << choice.dup
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'C3PO', 'Hal'].sample
  end

  def choose
    new_move = Move.new(Move::VALUES.sample)
    self.history << new_move.value.dup
    self.move = new_move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_history
    if human.history.size > 1
      puts "#{human.name} has previously chose #{human.history[0..-2].join(', ')}."
      puts "#{computer.name} previously chose #{computer.history[0..-2].join(', ')}."
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins"
    else
      puts "It's a tie!"
    end
  end

  def add_winner_score
    if human.move > computer.move
      human.increment_score
    elsif human.move < computer.move
      computer.increment_score
    end
  end

  def display_score
    puts "#{human.name} has #{human.score} wins"
    puts "#{computer.name} has #{computer.score} wins"
  end

  def game_over?
    human.win? || computer.win?
  end

  def play_again?
    choice = nil
    loop do
      puts "Play again? (y/n)"
      choice = gets.chomp
      break if ['y', 'n'].include?(choice.downcase)
      puts "Invalid entry, please enter y or n"
    end
    return true if choice == 'y'
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_history
      display_moves
      display_winner
      add_winner_score
      display_score
      break if game_over?
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

