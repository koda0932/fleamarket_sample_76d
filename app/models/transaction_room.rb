class TransactionRoom < ApplicationRecord
  has_many :transactions
  has_many :transaction_messages
end
