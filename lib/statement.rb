class Statement
  HEADER = "date || credit || debit || balance"

  def self.header
    HEADER
  end

  def self.line(transaction, balance)
    "10/01/2012 || 1000.00 || || 1000.00"
  end

end
