require 'date'
require_relative 'account'

class Transaction

  attr_reader :date
  attr_accessor :credit, :debit, :updated_balance

  def initialize(credit, debit, updated_balance)
    @date = Date.today
    @credit = credit
    @debit = debit
    @updated_balance = updated_balance
  end

  def self.create(credit, debit, updated_balance)
    Transaction.new(credit, debit, updated_balance)
  end

end