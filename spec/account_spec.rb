require 'account'

RSpec.describe Account do
  it 'has a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do
    it 'increases the current balance by the given transaction amount' do
      expect { subject.deposit(250) }.to change { subject.balance }.by 250
    end
  end

end