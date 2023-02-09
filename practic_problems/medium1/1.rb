# The balance variable when called from positive_balance? method doesn't need the @ prefix. This is because it is actually referening the balance getter method. However, if there was also a setter method, it would be more appropriate to reference the instance variable with self to access the getter method than going directly to the instance variable with the @ prefix.

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

bank1 = BankAccount.new(50)
bank2 = BankAccount.new(-10)

p bank1.positive_balance?
p bank2.positive_balance?
