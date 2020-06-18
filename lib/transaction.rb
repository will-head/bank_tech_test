class Transaction
  attr_reader :date, :amount
  attr_accessor :balance

  def initialize(date, amount)
    @date = date
    @amount = amount
    @balance = nil
  end

end
