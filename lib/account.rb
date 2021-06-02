require_relative 'transaction'

class Account

  ::OVERDRAFT_LIMIT = -150
  ::OPENING_BALANCE = 0

  attr_accessor :balance, :transaction_history, :transaction
  attr_reader :overdraft_limit

  def initialize(balance = OPENING_BALANCE, overdraft_limit = OVERDRAFT_LIMIT)
    @balance = balance
    @overdraft_limit = overdraft_limit
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    authorise(credit_transaction(amount))
  end

  def withdraw(amount)
    raise "Insufficient funds: overdraft limit exceeded" if overdrawn?(amount)
    @balance -= amount
  end

  private
    def credit_transaction(amount, transaction = Transaction)
      @transaction = transaction.create(amount, 0, @balance)
    end

    def authorise(transaction)
      @transaction_history << @transaction
    end

    def overdrawn?(amount)
      @balance - amount < @overdraft_limit
    end
end
