class Department < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user

  enum location: {'東京': 0, '深圳': 1, 'バンコク': 2, 'デュッセルドルフ': 3, 'ダラス': 4, 'その他': 5}
end
