class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = Array.new
  end

  def add(transaction)
    @balance += transaction.amount
    @transactions.push(transaction)
  end

  def transactions
    @transactions
  end

end
