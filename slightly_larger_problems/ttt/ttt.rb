require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, value| value.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    binding.pry
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer, :human_name, :computer_name
  attr_writer :human_marker, :human_name

  def initialize
    @board = Board.new
    @human_name = nil
    @computer_name = ['Hal', 'Chappie', 'R2D2', 'Data'].sample
    @human_marker = nil
    @computer_marker = nil
    @first_to_move = nil
    @current_marker = @human_marker
  end

  def play
    clear
    display_welcome_message
    enter_name
    pick_markers
    set_first_to_move
    clear

    main_game
    display_goodbye_message
  end

  private

  def set_first_to_move
    @first_to_move = @human_marker
  end

  def enter_name
    puts "Please enter your name"
    name = nil
    loop do
      name = gets.chomp.capitalize
      break if name.length > 1
      puts "Please enter a name"
    end
    self.human_name = name
  end

  def player_pick_marker
    puts "Please pick a marker (A - Z)"
    mark = nil
    loop do
    mark = gets.chomp.upcase
      break if mark.length == 1 && ('A'..'Z').include?(mark)
      puts "Please just pick one letter"
    end
    self.human_marker = mark
  end

  def create_players
    @human = Player.new(@human_marker)
    @computer = Player.new(@computer_marker)
  end

  def pick_markers
    player_pick_marker
    loop do
      @computer_marker = ['X', 'O'].sample
      break if @computer_marker != @human_marker
    end
    @current_marker = @human_marker
    create_players
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human_name} is #{human.marker}, #{computer_name} is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, goodbye"
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry that is not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = @computer_marker
    else
      computer_moves
      @current_marker = @human_marker
    end
  end

  def human_turn?
    @current_marker == @human_marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when @human_marker
      puts "You won!"
    when @computer_marker
      puts "The computer won!"
    else
      puts "The board is full, its a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must by y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = @first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
