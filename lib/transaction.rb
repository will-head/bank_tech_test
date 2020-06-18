class Transaction
  attr_reader :date

  def initialize(date, amount)
    @date = date
    @amount = amount
  end

  def amount
    @amount
  end

end
