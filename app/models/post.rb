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
                        "埼玉県": 0,
                        "千葉県": 1,
                        "東京都": 2,
                        "神奈川県":3, 
                        "新潟県": 4,
                        "富山県": 5,
                        "石川県": 6,
                        "福井県": 7,
                        "山梨県": 8,
                        "長野県": 9,
                        "岐阜県": 0,
                        "静岡県": 1,
                        "愛知県": 2,
                        "三重県": 3,
                        "滋賀県": 4,
                        "京都府": 5,
                        "大阪府": 6,
                        "兵庫県": 7,
                        "奈良県": 8,
                        "和歌山県": 9,
                        "鳥取県": 0,
                        "島根県": 1,
                        "岡山県": 2,
                        "広島県": 3,
                        "山口県": 4,
                        "徳島県": 5,
                        "香川県": 6,
                        "愛媛県": 7,
                        "高知県": 8,
                        "福岡県": 9,
                        "佐賀県": 0,
                        "長崎県": 1,
                        "熊本県": 2,
                        "大分県": 3,
                        "宮崎県": 4,
                        "鹿児島県": 5,
                        "沖縄県": 6}
  enum shipping: { "1~2日": 0, "2~4日": 1, "5~7日": 2 }


end