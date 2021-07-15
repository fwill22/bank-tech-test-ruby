require_relative 'transaction'
require_relative 'statement'

class Account
  OVERDRAFT_LIMIT = -150
  OPENING_BALANCE = 0

  attr_accessor :balance, :transaction_history, :transaction
  attr_reader :overdraft_limit, :statement

  def initialize(balance = OPENING_BALANCE, overdraft_limit = OVERDRAFT_LIMIT, statement = Statement.new, transaction_class = Transaction)
    @balance = balance
    @overdraft_limit = overdraft_limit
    @transaction_history = []
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    raise 'Error: please enter valid amount' if amount <= 0

    @balance += amount
    authorise(credit_transaction(amount))
  end

  def withdraw(amount)
    raise 'Error: please enter valid amount' if amount <= 0
    raise 'Insufficient funds: overdraft limit exceeded' if overdrawn?(amount)

    @balance -= amount
    authorise(debit_transaction(amount))
  end

  def print_statement
    @statement.print(@transaction_history)
  end

  private

  def credit_transaction(amount)
    @transaction = @transaction_class.create(amount, 0, @balance)
  end

  def debit_transaction(amount)
    @transaction = @transaction_class.create(0, amount, @balance)
  end

  def authorise(_transaction)
    @transaction_history << transaction
  end

  def overdrawn?(amount)
    @balance - amount < @overdraft_limit
  end
end
