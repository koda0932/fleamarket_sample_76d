class UserAddress < ApplicationRecord
  validates :postcode, :prefecture, :city, :address ,presence: true
  belongs_to :user, optional: true 
end
