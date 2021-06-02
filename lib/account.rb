class Account
  attr_reader :balance, :overdraft_limit

  

  def initialize
    @balance = 0
    @overdraft_limit = -150
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Insufficient funds: overdraft limit exceeded" if @balance - amount < @overdraft_limit
    @balance -= amount
  end
end
