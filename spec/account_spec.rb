require 'account'

RSpec.describe Account do
  let(:subject) { described_class.new }

  it 'has a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do

    let(:transaction) { double(:transaction) }
    
    it 'increases the current balance by the given transaction amount' do
      expect { subject.deposit(250) }.to change { subject.balance }.from(0).to(250)
    end

    it 'stores the given amount as credit in a Transaction object' do
      
    end
  end

  describe '#withdraw' do
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
end
