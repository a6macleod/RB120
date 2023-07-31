class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def to_s
    "#{rank} of #{suit}"
  end


  def value
    VALUES.fetch(rank, rank) # gets the number from VALUES or defaults to the provided value, if a number
  end

  protected

  def <=>(other)
    value <=> other.value
  end
end
