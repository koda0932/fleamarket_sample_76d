class Card < ApplicationRecord
  validates :user_id,presence: true
  validates :costomer_id ,presence: true
  validates :card_id ,presence: true
  has_many :users
end
