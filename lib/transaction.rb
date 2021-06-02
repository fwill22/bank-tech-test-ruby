require 'date'

class Transaction

  attr_reader :date
  attr_accessor :credit, :debit, :updated_balance

  def initialize
    @date = Date.today
    @credit = nil
    @debit = nil
    @updated_balance = nil
  end

end