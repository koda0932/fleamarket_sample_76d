class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :prefecture, :city, :address, :apartment, :telephone ,presence: true
end

