class Statement
  HEADER = "date || credit || debit || balance"

  def self.header
    HEADER
  end

  def self.line(transaction, balance)
    if transaction.amount >= 0
      credit = transaction.amount
    else
      debit = transaction.amount.abs
    end

    date_string = format_date(transaction.date)
    credit_string = format_money(credit)
    debit_string = format_money(debit)
    balance_string = format_money(balance).delete_suffix(' ')

    "#{date_string}||#{credit_string}||#{debit_string}||#{balance_string}"
  end

  def self.format_money(amount)
    return " " if amount.nil?
    
    " #{Money.new(amount).format(symbol: false, thousands_separator: '')} "
  end

  def self.format_date(date)
    date.strftime("%d/%m/%Y ")
  end

  private_class_method :format_money, :format_date
end
