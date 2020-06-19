require 'money'
require 'transaction'
require 'account'
require 'statement'

EXAMPLE_STATEMENT_HEADER        = "date || credit || debit || balance\n"
EXAMPLE_STATEMENT_TRANSACTION_1 = "10/01/2012 || 1000.00 || || 1000.00\n"
EXAMPLE_STATEMENT_TRANSACTION_2 = "13/01/2012 || 2000.00 || || 3000.00\n"
EXAMPLE_STATEMENT_TRANSACTION_3 = "14/01/2012 || || 500.00 || 2500.00\n"

EXAMPLE_STATEMENT = EXAMPLE_STATEMENT_HEADER + \
EXAMPLE_STATEMENT_TRANSACTION_3 + \
EXAMPLE_STATEMENT_TRANSACTION_2 + \
EXAMPLE_STATEMENT_TRANSACTION_1

describe 'statement' do
  let(:account) { Account.new }

  let(:transaction_1) { Transaction.new(Date.new(2012, 1, 10), 1000 * 100) }
  let(:transaction_2) { Transaction.new(Date.new(2012, 1, 13), 2000 * 100) }
  let(:transaction_3) { Transaction.new(Date.new(2012, 1, 14), -500 * 100) }

  it 'returns header line if no transactions' do
    expect(Statement.show(account)).to eq EXAMPLE_STATEMENT_HEADER
  end

  it 'returns statement for single credit' do
    account.add(transaction_1)
    expect(Statement.show(account)).to eq EXAMPLE_STATEMENT_HEADER + EXAMPLE_STATEMENT_TRANSACTION_1
  end

  it 'returns statement for multiple credits' do
    account.add(transaction_1)
    account.add(transaction_2)
    expect(Statement.show(account)).to eq EXAMPLE_STATEMENT_HEADER + EXAMPLE_STATEMENT_TRANSACTION_2 + EXAMPLE_STATEMENT_TRANSACTION_1
  end

  it 'returns line for credits and debits' do
    account.add(transaction_1)
    account.add(transaction_2)
    account.add(transaction_3)
    expect(Statement.show(account)).to eq EXAMPLE_STATEMENT
  end

end
