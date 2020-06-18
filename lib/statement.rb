class Statement
  HEADER = "date || credit || debit || balance"

  def self.header
    HEADER
  end

  def self.line(transaction, balance)
    credit = transaction.amount

    "#{format_date(transaction.date)} || #{format_money(credit)} || || #{format_money(balance)}"
  end

  def self.format_money(amount)
    Money.new(amount).format(symbol: false, thousands_separator: '')
  end

  def self.format_date(date)
    date.strftime("%d/%m/%Y")
  end

  private_class_method :format_money, :format_date
end
