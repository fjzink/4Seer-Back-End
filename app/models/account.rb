class Account < ApplicationRecord
	has_many :caretakers
  has_many :transactions

end
