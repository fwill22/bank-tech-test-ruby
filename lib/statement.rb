require_relative 'account'

class Statement
  def print(transaction_history)
    puts "#{header} #{format_statement(transaction_history)}"
  end

  def format_statement(transaction_history)
    transaction_history.reverse.map { |transaction| format_transaction(transaction) }.join("\n")
  end

  private

  def header
    puts "|    date    ||  credit  ||  debit  || balance  |\n"
  end

  def format_transaction(transaction)
    puts "| #{format_date(transaction)} "\
          "|| #{format_amount(transaction.credit)}  "\
          "|| #{format_amount(transaction.debit)}  "\
          "|| #{format_amount(transaction.updated_balance)}  |\n"
  end

  def format_date(transaction)
    transaction.date.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    if amount.zero?
      '     '
    else
      format('%.2f', amount)
    end
  end
end
