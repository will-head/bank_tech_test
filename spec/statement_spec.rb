require 'statement'

describe 'statement' do

  it 'returns header line' do
    expect(Statement.header).to eq "date || credit || debit || balance"
  end

end
