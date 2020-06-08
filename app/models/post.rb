class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :introduce, presence: true
  validates :category_id, presence: true
  validates :delivery_fee, presence: true
  validates :status, presence: true
  validates :delivery_status, presence: true
  validates :user_address, presence: true
  validates :shipping, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  
  enum category: { "男性": 0, "女性": 1}
  enum status: { "新品": 0, "未使用": 1}
  enum delivery_status: { "着払い（購入者負担）": 0, "出品者負担": 1}
  enum shipping: { "1~2": 0, "2~4": 1, "5~7": 2 }

  mount_uploader :image, ImageUploader

end
