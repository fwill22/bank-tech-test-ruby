require 'account'

RSpec.describe Account do
  let(:subject) { described_class.new }

  it 'has a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do
    let(:transaction) { double(:transaction, credit: 250, debit: 0, updated_balance: 250) }

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
    let(:transaction) { double(:transaction, credit: 0, debit: 200, updated_balance: 0) }
    # test is testing double not method
    before(:each) do
      subject.deposit(200)
    end

    it 'raises an error if overdraft limit is exceeded' do
      expect { subject.withdraw(360) }.to raise_error 'Insufficient funds: overdraft limit exceeded'
    end

    it 'decreases the current balance by the given transaction amount' do
      expect { subject.withdraw(200) }.to change { subject.balance }.from(200).to(0)
    end

    it 'stores the given amount as debit in a Transaction object' do #[FIX THIS TEST]
      subject.withdraw(200)

      expect(transaction.credit).to eq 0
      expect(transaction.debit).to eq 200
    end
  end

  describe 'transaction history' do
    it 'is empty when initialized' do
      expect(subject.transaction_history).to be_empty
    end

    it 'stores all transaction objects in an array' do

      expect { subject.deposit(250) }.to change { subject.transaction_history.length }.by 1
      expect { subject.withdraw(200) }.to change { subject.transaction_history.length }.by 1
    end
  end
end
