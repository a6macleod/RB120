class GuessingGame
  attr_reader :lowest_number, :greatest_number
  attr_accessor :number_of_guesses, :players_guess

  def initialize(low = 1, high = 100)
    @secret_number = (low..high).to_a.sample
    @lowest_number = low
    @greatest_number = high
    @number_of_guesses = Math.log2(high - low + 1).to_i + 1
    @players_guess = nil
  end

  def display_welcome
    puts 'Welcome to Number Guess'
    puts 'we will pick a number and you guess it!'
  end

  def display_guesses_left
    puts ''
    puts "You have #{number_of_guesses} guesses remaining."
    puts ''
  end

  def valid_pick?(num)
    num >= lowest_number && num <= greatest_number
  end

  def pick_number
    guess = nil
    loop do
      puts "Enter a number between #{lowest_number} and #{greatest_number}:"
      guess = gets.chomp.to_i
      break if valid_pick?(guess)
      puts 'Invalid guess'
      puts ''
    end
    self.players_guess = guess
  end

  def evaluate_guess
    self.number_of_guesses -= 1

    puts ''
    if players_guess < secret_number
      puts 'Your guess is too low.'
    elsif players_guess > secret_number
      puts 'Your guess is too high'
    elsif players_guess == secret_number
      puts "That's the number!"
    end
    puts ''
  end

  def player_won?
    players_guess == secret_number
  end

  def out_of_guesses?
    number_of_guesses <= 0
  end

  def display_result
    if player_won?
      puts 'You Won!'
    else
      puts 'You have no more guesses. You lost!'
    end
  end

  def play
    puts number_of_guesses
    display_welcome
    puts secret_number
    loop do
      break if player_won? || out_of_guesses?
      display_guesses_left
      pick_number
      evaluate_guess
    end
    display_result
  end

  private

  attr_reader :secret_number
end

game = GuessingGame.new(501, 1500)
game.play
