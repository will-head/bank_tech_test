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

end
