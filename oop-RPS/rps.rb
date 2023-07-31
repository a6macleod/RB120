module Score
  attr_accessor :score

  MAX_SCORE = 3

  def initialize
    self.score = 0
  end

  def increment_score
    self.score += 1
  end

  def win?
    score >= MAX_SCORE
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

  def less_than_rock?
    scissors? || lizard?
  end

  def less_than_paper?
    rock? || spock?
  end

  def less_than_scissors?
    paper? || lizard?
  end

  def less_than_lizard?
    paper? || spock?
  end

  def less_than_spock?
    rock? || scissors?
  end

  def greater_than_rock?
    paper? || spock?
  end

  def greater_than_paper?
    scissors? || lizard?
  end

  def greater_than_scissors?
    rock? || spock?
  end

  def greater_than_lizard?
    rock? || scissors?
  end

  def greater_than_spock?
    lizard? || paper?
  end

  def >(other_move)
    (rock? && other_move.less_than_rock?) ||
      (paper? && other_move.less_than_paper?) ||
      (scissors? && other_move.less_than_scissors?) ||
      (lizard? && other_move.less_than_lizard?) ||
      (spock? && other_move.less_than_spock?)
  end

  def <(other_move)
    (rock? && other_move.greater_than_rock?) ||
      (paper? && other_move.greater_than_paper?) ||
      (scissors? && other_move.greater_than_scissors?) ||
      (lizard? && other_move.greater_than_lizard?) ||
      (spock? && other_move.greater_than_spock?)
  end

  def to_s
    @value
  end
end

class Player
  include Score

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
    history << choice.dup
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'C3PO', 'Hal'].sample
  end

  def choose
    new_move = Move.new(Move::VALUES.sample)
    history << new_move.value.dup
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

  def previous_moves(player)
    player.history[0..-2].join(', ')
  end

  def display_history
    return unless human.history.size > 1
    puts "#{human.name} has previously chose #{previous_moves(human)}."
    puts "#{computer.name} previously chose #{previous_moves(computer)}."
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

  def game_round
    human.choose
    computer.choose
    display_history
    display_moves
    display_winner
    add_winner_score
    display_score
  end

  def play
    display_welcome_message
    loop do
      game_round
      break if game_over?
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
