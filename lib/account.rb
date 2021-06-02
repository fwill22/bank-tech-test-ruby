class Account

  ::OVERDRAFT_LIMIT = -150
  ::OPENING_BALANCE = 0

  attr_accessor :balance, :transaction_history
  attr_reader :overdraft_limit

  def initialize(balance = OPENING_BALANCE, overdraft_limit = OVERDRAFT_LIMIT)
    @balance = balance
    @overdraft_limit = overdraft_limit
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Insufficient funds: overdraft limit exceeded" if @balance - amount < @overdraft_limit
    @balance -= amount
  end
end
