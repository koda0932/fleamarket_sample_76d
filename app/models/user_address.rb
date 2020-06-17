class UserAddress < ApplicationRecord
  validates :postcode, :prefecture, :city, :address, :apartment_first_name, :apartment_first_name_kana, :apartment_family_name, :apartment_family_name_kana ,presence: true
  validates :postcode, format: { with: /\A\d{3}\-?\d{4}\z/ }
  belongs_to :user, optional: true 
end
