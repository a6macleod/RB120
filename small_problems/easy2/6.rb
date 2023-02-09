# Modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  protected

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  attr_reader :amount
end

bills_wallet = Wallet.new(465)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

# puts bills_wallet.amount
