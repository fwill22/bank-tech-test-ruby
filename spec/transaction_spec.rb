require 'transaction'

RSpec.describe Transaction do
  let(:subject) { described_class.new }

  describe 'date' do
    it 'returns todays date' do
      expect(subject.date).to eq Date.today
    end
  end

  describe 'credit' do
    it 'is nil when initialized' do
      expect(subject.credit).to be nil
    end
  end

  describe 'debit' do
    it 'is nil when initialized' do
      expect(subject.debit).to be nil
    end
  end
  
end