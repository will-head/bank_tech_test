require 'account'

describe 'account' do
  let(:account) { Account.new }

  let(:date) { Date.new(2012, 1, 10) }
  let(:amount) { 1000 * 100 }
  let(:transaction) { Transaction.new(date, amount) }

  it '#balance returns zero on creation' do
    expect(account.balance).to eq 0
  end

  it 'Adding a transaction changes the balance by the same amount' do
    expect { account.add(transaction) }.to change { account.balance }.by(amount)
  end

  it 'Adding a transaction updates the balance of the transaction' do
    result = account.add(transaction)
    expect(result.balance).to eq account.balance
  end

  it '#transactions returns an array of transactions' do
    date_1 = Date.new(2012, 1, 13)
    amount_1 = 2000 * 100
    transaction_1 = Transaction.new(date_1, amount_1)

    account.add(transaction)
    account.add(transaction_1)

    expect(account.transactions).to eq [transaction, transaction_1]
  end

end
