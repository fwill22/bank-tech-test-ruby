require 'account'

RSpec.describe Account do
  it 'has a default starting balance of £0' do
    expect(subject.balance).to eq(0)
  end

end