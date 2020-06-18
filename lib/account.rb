class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Array.new
  end

  def add(transaction)
    @balance += transaction.amount
    transaction.balance = @balance
    @transactions.push(transaction)
    @transactions.last
  end

end
