require 'transaction'

describe 'transaction' do
  let(:date) { Date.new(2012, 1, 10) }
  let(:amount) { 1000 * 100 }

  it '#date returns transaction date' do
    transaction = Transaction.new(date, amount)
    expect(transaction.date).to eq date
  end

  it '#amount returns transaction amount' do
    transaction = Transaction.new(date, amount)
    expect(transaction.amount).to eq amount
  end

end
