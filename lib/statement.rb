class Statement
  HEADER = "date || credit || debit || balance"

  def self.header
    HEADER
  end

  def self.line(transaction, balance)
    balance_string = Money.new(balance).format(symbol: false, thousands_separator: '')
    credit_string = Money.new(transaction.amount).format(symbol: false, thousands_separator: '')
    date_string = transaction.date.strftime("%d/%m/%Y")
    "#{date_string} || #{credit_string} || || #{balance_string}"
  end

end
