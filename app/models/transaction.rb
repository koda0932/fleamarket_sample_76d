class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :post
  validates :post_id, uniqueness: true
  belongs_to :transaction_room

  enum review: { "良い": 0, "悪い": 1}
end
