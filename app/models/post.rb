class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_images, dependent: :destroy

  validates :name, presence: true
  validates :introduce, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  validates :delivery_status, presence: true
  validates :user_address, presence: true
  validates :shipping, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  accepts_nested_attributes_for :post_images, allow_destroy: true

  enum status: { "新品/未使用": 0, "目立った汚れや傷なし": 1, "汚れ、傷あり": 2}
  enum delivery_status: { "購入者負担": 0, "出品者負担": 1}
  enum user_address: { "東京都": 0, "神奈川県": 1}
  enum shipping: { "1~2": 0, "2~4": 1, "5~7": 2 }


end