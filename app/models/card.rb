class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, uniqueness: true
end
