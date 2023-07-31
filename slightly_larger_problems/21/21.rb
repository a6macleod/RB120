module Display
  def prompt(msg)
    puts "==> #{msg}"
  end

  def display_garnish(msg)
    puts "<> #{msg}"
  end

  def display_name(card)
    case card
    when 'a' then 'Ace'
    when 'j' then 'Jack'
    when 'q' then 'Queen'
    when 'k' then 'King'
    else card
    end
  end

  def joinor(array, separator = ', ', conjunction = 'and')
    return_array = array.dup
    return_array[-1] = conjunction + ' ' + return_array[-1].to_s
    if return_array.length > 2
      return_array.join(separator)
    elsif return_array.length < 2
      array.join
    else
      return_array.join(' ')
    end
  end

  def clear_screen
    system 'clear'
  end

  def display_hand(hand)
    all_cards = hand.map do |card|
      display_name(card.value)
    end
    joinor(all_cards)
  end
end

class Participant
  attr_accessor :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  def busted?
    score > Game::MAX_SCORE
  end

  def total
    sum = 0
    hand.each do |card|
      sum += card.score
    end

    hand.select { |card| card.value == "a" }.count.times do
      sum -= 10 if sum > Game::MAX_SCORE
    end

    self.score = sum
  end
end

class Player < Participant
  include Display

  def stay?
    answer = nil
    loop do
      prompt "would you like to hit? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      prompt "Please enter y or n"
    end
    answer == 'n'
  end
end

class Dealer < Participant
  MIN_STAY_SCORE = 17
end

class Deck
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'j', 'q', 'k', 'a']
  SUIT = ['h', 'd', 'c', 's']

  attr_accessor :deck

  def initialize
    @deck = populate_deck
  end

  def populate_deck
    new_deck = []
    SUIT.each do |suit|
      CARDS.each do |card|
        new_deck << Card.new(suit, card)
      end
    end
    new_deck
  end

  def remove_from_deck(card)
    deck.delete(card)
  end

  def deal(person, number_of_cards)
    number_of_cards.times do
      card = deck.sample
      person.hand << card
      remove_from_deck(card)
    end
    person.total
  end
end

class Card
  attr_reader :value, :score

  def initialize(suit, value)
    @suit = suit
    @value = value
    @score = card_worth(value)
  end

  def card_worth(card)
    case card
    when 'a' then 11
    when 'j' then 10
    when 'q' then 10
    when 'k' then 10
    else card.to_i
    end
  end
end

class Game
  include Display

  MAX_SCORE = 21

  attr_accessor :human, :dealer, :deck

  def initialize
    @human = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  private

  def deal_cards
    deck.deal(human, 2)
    deck.deal(dealer, 2)
  end

  def show_initial_cards
    clear_screen
    display_garnish "Dealer has: #{display_name(dealer.hand.first.value)} and ?"
    puts ''
    display_garnish "You have: #{display_hand(human.hand)}"
    display_garnish "Your score: #{human.score}"
    puts ''
  end

  def player_turn
    loop do
      show_initial_cards
      break if human.busted?

      break if human.stay?
      deck.deal(human, 1)
    end
  end

  def dealer_turn
    loop do
      break if dealer.score >= Dealer::MIN_STAY_SCORE || dealer.busted?
      deck.deal(dealer, 1)
    end
  end

  def show_result
    clear_screen
    display_garnish "Dealer hand: #{display_hand(dealer.hand)}"
    display_garnish "Dealer score: #{dealer.score}"
    puts ''
    display_garnish "Your hand: #{display_hand(human.hand)}"
    display_garnish "Your score: #{human.score}"
    puts ''
    display_winner
  end

  def someone_busted?
    human.busted? || dealer.busted?
  end

  def display_busted_winner
    if human.busted?
      prompt "You busted! Dealer won!"
    else
      prompt "Dealer busted! You won!"
    end
  end

  def display_winner
    case
    when someone_busted?
      display_busted_winner
    when dealer.score < human.score
      prompt "You win!"
    when dealer.score > human.score
      prompt "Dealer wins!"
    else
      prompt "It's a tie!"
    end
  end
end

Game.new.start
