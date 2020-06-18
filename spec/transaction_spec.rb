require 'transaction'

describe 'transaction' do

  it '#date returns transaction date' do
    date = Date.new(2012, 1, 10)
    amount = 1000 * 100
    transaction = Transaction.new(date, amount)
    expect(transaction.date).to eq date
  end

end
