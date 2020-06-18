require 'account'
# require 'transaction'

describe 'account' do
  let(:date) { Date.new(2012, 1, 10) }
  # let(:amount) { 1000 * 100 }

  it '#balance returns zero on creation' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it 'Adding a positive transaction increases the balance by the same amount' do
    account = Account.new
    previous_balance = account.balance
    amount = 1000 * 100
    transaction = Transaction.new(date, amount)
    
    # expect(account.add(transaction)).to change { account.balance }.by(amount)
    account.add(transaction)
    expect(account.balance).to eq previous_balance + amount
  end

end
