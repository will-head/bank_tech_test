class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def add(transaction)
    @balance += transaction.amount
  end
end
