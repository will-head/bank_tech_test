class Transaction
  attr_reader :date, :amount
  attr_accessor :balance

  def initialize(amount, date = Date.today)
    @date = date
    @amount = amount
    @balance = nil
  end

end
