require 'transaction'

describe 'transaction' do
  let(:date) { Date.new(2012, 1, 10) }
  let(:amount) { 1000 * 100 }

  it '#date returns transaction date' do
    transaction = Transaction.new(amount, date)
    expect(transaction.date).to eq date
  end

  it '#amount returns transaction amount' do
    transaction = Transaction.new(amount, date)
    expect(transaction.amount).to eq amount
  end

  it '#balance returns nil' do
    transaction = Transaction.new(amount, date)
    expect(transaction.balance).to eq nil
  end

end
