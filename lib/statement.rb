class Statement
  HEADER = "date || credit || debit || balance\n"

  def self.show(account)
    statement = header
    account.transactions.reverse.each { |transaction| statement += line(transaction) }

    statement
  end

  def self.header
    HEADER
  end

  def self.line(transaction)
    if transaction.amount >= 0
      credit = transaction.amount
    else
      debit = transaction.amount.abs
    end

    date_string = format_date(transaction.date)
    credit_string = format_money(credit)
    debit_string = format_money(debit)
    balance_string = format_money(transaction.balance).delete_suffix(' ')

    "#{date_string}||#{credit_string}||#{debit_string}||#{balance_string}\n"
  end

  def self.format_money(amount)
    return " " if amount.nil?
    
    Money.locale_backend = nil
    Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
    " #{Money.new(amount, 'GBP').format(symbol: false, thousands_separator: '')} "
  end

  def self.format_date(date)
    date.strftime("%d/%m/%Y ")
  end

  private_class_method :header, :line, :format_money, :format_date
end
