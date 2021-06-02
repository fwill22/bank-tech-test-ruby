require 'account'

RSpec.describe Account do
  let(:subject) { described_class.new }

  it 'has a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do
    let(:subject) { described_class.new }
    let(:transaction) { double(:transaction, :credit => 250, :debit => 0, :updated_balance => 250) }

    it 'increases the current balance by the given transaction amount' do
      expect { subject.deposit(250) }.to change { subject.balance }.from(0).to(250)
    end

    it 'stores the given amount as credit in a Transaction object' do
      subject.deposit(250)

      expect(transaction.credit).to eq 250
      expect(transaction.debit).to eq 0
    end
  end

  describe '#withdraw' do
    #stub test so unaffected by deposit method (isolate)?
    before(:each) do
      subject.deposit(200)
    end

    it 'decreases the current balance by the given transaction amount' do
      expect { subject.withdraw(200) }.to change { subject.balance }.from(200).to(0)
    end

    it 'raises an error if overdraft limit is exceeded' do
      expect { subject.withdraw(360) }.to raise_error "Insufficient funds: overdraft limit exceeded"
    end
  end

  describe 'transaction history' do
    it 'is empty when initialized' do
      expect(subject.transaction_history).to be_empty
    end
    
    it 'stores all transaction objects in an array' do
      # deposit_transaction = double(:transaction, :credit => 250, :credit => 0, :updated_balance => 250)

      expect { subject.deposit(250) }.to change { subject.transaction_history.length }.by 1
    end
  end
end
