class Project < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :product

  has_many :project_users, dependent: :destroy
  has_many :project_user_users, through: :project_users, source: :user

  enum status: {'活動中': 0, '一時中止': 1, '終了': 2}
end
