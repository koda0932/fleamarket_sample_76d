class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  validates :nickname, :first_name,:first_name_kana, :family_name, :family_name_kana, :birthday ,presence: true
  has_one :address
end