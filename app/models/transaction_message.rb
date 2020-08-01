class TransactionMessage < ApplicationRecord
  belongs_to :transaction_room
  belongs_to :user
end
