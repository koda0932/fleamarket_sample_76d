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
  has_many :transactions, foreign_key: "buyer_id", class_name: "Transaction"
  has_many :transactions, foreign_key: "seller_id", class_name: "Transaction"
  has_many :transaction_messages
  # has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship"
  # has_many :followers, through: :follower_relationships
  # has_many :seller, foreign_key: "seller_id", class_name: "Transaction"
  # has_many :following, through: :following_relationships
end