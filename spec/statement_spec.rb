require 'i18n'
require 'money'
require 'statement'

I18n.enforce_available_locales = false
I18n.default_locale = :en

describe 'statement' do

  let(:transaction_1) { Transaction.new(Date.new(2012, 1, 10), 1000 * 100) }
  let(:transaction_2) { Transaction.new(Date.new(2012, 1, 13), 2000 * 100) }
  let(:transaction_3) { Transaction.new(Date.new(2012, 1, 14), -500 * 100) }

  it 'returns header line' do
    expect(Statement.header).to eq "date || credit || debit || balance"
  end

  it 'returns line for credit' do
    expect(Statement.line(transaction_1, 1000 * 100)).to eq "10/01/2012 || 1000.00 || || 1000.00" 
  end

  it 'returns line for debit' do
    expect(Statement.line(transaction_3, 2500 * 100)).to eq "14/01/2012 || || 500.00 || 2500.00" 
  end

end
