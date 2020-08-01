class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :transaction_room
end
