require 'account'

describe 'account' do
  it '#balance returns zero on creation' do
    account = Account.new
    expect(account.balance).to eq 0
  end
end
