class User < ApplicationRecord
  has_many :documents, dependent: :destroy

  has_many :members, dependent: :destroy
  has_many :member_departments, through: :members, source: :department

  has_many :project_users, dependent: :destroy
  has_many :project_user_projects, through: :project_users, source: :project

  has_many :reviewers, dependent: :destroy
  has_many :reviewer_reviews, through: :reviewers, source: :review


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum mr_ms: {'Mr.': 1, 'Ms.': 2}
end
