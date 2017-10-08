class Account < ApplicationRecord
	has_many :caretakers
  has_many :transactions

  def newest_transactions
    transactions.order(date_time: :desc)
  end
end
