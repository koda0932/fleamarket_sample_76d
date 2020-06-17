class UserAddress < ApplicationRecord
  validates :postcode, :prefecture, :city, :address ,presence: true
  validates :postcode, format: { with: /\A\d{3}\-?\d{4}\z/ }
  belongs_to :user, optional: true 
end
