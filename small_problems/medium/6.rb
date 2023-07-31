class GuessingGame
  attr_accessor :number_of_guesses, :players_guess

  MAX_GUESSES = 7
  LOWEST_NUMBER = 1
  GREATEST_NUMBER = 100

  def initialize
    @secret_number = (1..100).to_a.sample
    @number_of_guesses = 0
    @players_guess = nil
  end

  def display_welcome
    puts 'Welcome to Number Guess'
    puts 'we will pick a number and you guess it!'
  end

  def display_guesses_left
    puts ''
    puts "You have #{MAX_GUESSES - number_of_guesses} guesses remaining."
    puts ''
  end

  def valid_pick?(num)
    num >= LOWEST_NUMBER && num <= GREATEST_NUMBER
  end

  def pick_number
    guess = nil
    loop do
      puts 'Enter a number between 1 and 100:'
      guess = gets.chomp.to_i
      break if valid_pick?(guess)
      puts 'Invalid guess'
      puts ''
    end
    self.players_guess = guess
  end

  def evaluate_guess
    self.number_of_guesses += 1

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
    number_of_guesses >= MAX_GUESSES
  end

  def display_result
    if player_won?
      puts 'You Won!'
    else
      puts 'You have no more guesses. You lost!'
    end
  end

  def play
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

game = GuessingGame.new
game.play
=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end
