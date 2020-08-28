class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_images, dependent: :destroy
  accepts_nested_attributes_for :post_images, allow_destroy: true
  has_many :transactions
  has_many :post_brands, dependent: :destroy
  accepts_nested_attributes_for :post_brands, allow_destroy: true

  validates :name, presence: true
  validates :introduce, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  validates :delivery_status, presence: true
  validates :user_address, presence: true
  validates :shipping, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 , less_than: 10000000}
  validates :user_id, presence: true


  enum status: { "新品/未使用": 0, "目立った汚れや傷なし": 1, "汚れ、傷あり": 2}
  enum delivery_status: { "購入者負担": 0, "出品者負担": 1}
  enum user_address: { "北海道": 0,
                        "青森県": 1,
                        "岩手県": 2,
                        "宮城県": 3,
                        "秋田県": 4,
                        "山形県": 5,
                        "福島県": 6,
                        "茨城県": 7,
                        "栃木県": 8,
                        "群馬県": 9,
                        "埼玉県": 10,
                        "千葉県": 11,
                        "東京都": 12,
                        "神奈川県":13,
                        "新潟県": 14,
                        "富山県": 15,
                        "石川県": 16,
                        "福井県": 17,
                        "山梨県": 18,
                        "長野県": 19,
                        "岐阜県": 20,
                        "静岡県": 21,
                        "愛知県": 22,
                        "三重県": 23,
                        "滋賀県": 24,
                        "京都府": 25,
                        "大阪府": 26,
                        "兵庫県": 27,
                        "奈良県": 28,
                        "和歌山県": 29,
                        "鳥取県": 30,
                        "島根県": 31,
                        "岡山県": 32,
                        "広島県": 33,
                        "山口県": 34,
                        "徳島県": 35,
                        "香川県": 36,
                        "愛媛県": 37,
                        "高知県": 38,
                        "福岡県": 39,
                        "佐賀県": 40,
                        "長崎県": 41,
                        "熊本県": 42,
                        "大分県": 43,
                        "宮崎県": 44,
                        "鹿児島県": 45,
                        "沖縄県": 46}
  enum shipping: { "1~2日": 0, "2~4日": 1, "5~7日": 2 }


end