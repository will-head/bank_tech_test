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
      credit_amount = transaction.amount
    else
      debit_amount = transaction.amount.abs
    end

    date = format_date(transaction.date)
    credit = format_money(credit_amount)
    debit = format_money(debit_amount)
    balance = format_money(transaction.balance).delete_suffix(' ')

    "#{date}||#{credit}||#{debit}||#{balance}\n"
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
