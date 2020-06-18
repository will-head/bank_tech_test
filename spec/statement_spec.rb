require 'statement'

describe 'statement' do

  let(:transaction_1) { Transaction.new(Date.new(2012, 1, 10), 1000 * 100) }

  it 'returns header line' do
    expect(Statement.header).to eq "date || credit || debit || balance"
  end

  it 'returns line for credit' do
    expect(Statement.line(transaction_1, 1000 * 100)).to eq "10/01/2012 || 1000.00 || || 1000.00" 
  end

end
