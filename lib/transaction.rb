class Transaction
  attr_reader :date, :amount, :balance

  def initialize(date, amount)
    @date = date
    @amount = amount
    @balance = nil
  end

end
