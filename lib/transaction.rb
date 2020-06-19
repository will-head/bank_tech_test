class Transaction
  attr_reader :date, :amount
  attr_accessor :balance

  def initialize(amount, date = Date.new)
    @date = date
    @amount = amount
    @balance = nil
  end

end
