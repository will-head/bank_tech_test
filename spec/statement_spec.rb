require 'money'
require 'transaction'
require 'account'
require 'statement'

EXAMPLE_STATEMENT = 
"date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
"

describe 'statement' do
  let(:account) { Account.new }

  let(:transaction_1) { Transaction.new(Date.new(2012, 1, 10), 1000 * 100) }
  let(:transaction_2) { Transaction.new(Date.new(2012, 1, 13), 2000 * 100) }
  let(:transaction_3) { Transaction.new(Date.new(2012, 1, 14), -500 * 100) }

  it 'returns header line' do
    expect(Statement.header).to eq "date || credit || debit || balance\n"
  end

  it 'returns line for credit' do
    transaction_1.balance = 1000 * 100
    expect(Statement.line(transaction_1)).to eq "10/01/2012 || 1000.00 || || 1000.00\n" 
  end

  it 'returns line for debit' do
    transaction_3.balance = 2500 * 100
    expect(Statement.line(transaction_3)).to eq "14/01/2012 || || 500.00 || 2500.00\n" 
  end

  it 'returns a statement for an account' do
    account.add(transaction_1)
    account.add(transaction_2)
    account.add(transaction_3)

    expect(Statement.show(account)).to eq EXAMPLE_STATEMENT
  end

end
