require 'statement'
require 'account'

RSpec.describe Statement do
  let(:subject) { described_class.new }
  let(:credit_transaction) { double(:transaction, date: Date.today, credit: 1000, debit: 0, updated_balance: 1000) }
  let(:credit_transaction2) { double(:transaction, date: Date.today, credit: 2000, debit: 0, updated_balance: 3000) }
  let(:debit_transaction) { double(:transaction, date: Date.today, credit: 0, debit: 500, updated_balance: 2500) }
  let(:transaction_history) { [credit_transaction, credit_transaction2, debit_transaction] }

  it 'prints out the transaction history formatted and in reverse chronology' do
    expect { subject.print(transaction_history) }.to output(
      "|    date    ||  credit  ||  debit  || balance  |\n"\
      "| #{Date.today.strftime('%d/%m/%Y')} ||        || 500.00  || 2500.00  |\n"\
      "| #{Date.today.strftime('%d/%m/%Y')} || 2000.00  ||        || 3000.00  |\n"\
      "| #{Date.today.strftime('%d/%m/%Y')} || 1000.00  ||        || 1000.00  |\n"
    ).to_stdout
  end
end

#  Stub tests for Date.today
