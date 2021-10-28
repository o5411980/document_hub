class Product < ApplicationRecord
  validates :category, presence: true
  validates :status, presence: true

  has_many :documents, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :projects, dependent: :destroy

  enum category: {'マウス': 1, 'キーボード': 2, 'バッテリー': 3}
  enum status: {'開発中': 0, '製造中': 1, '製造中止': 2}
  enum location: {'未定': 0, '東京': 1, '深圳': 2, 'バンコク': 3, 'デュッセルドルフ': 4, 'ダラス': 5}
end
