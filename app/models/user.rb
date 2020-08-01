class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday ,presence: true
  validates :first_name, :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  has_one :user_address
  has_one :card
  has_many :transactions
  has_many :transaction_messages
end