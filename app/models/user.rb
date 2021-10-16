class User < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :member_departments, through: :members, source: :department

  has_many :project_users, dependent: :destroy
  has_many :project_user_projects, through: :project_users, source: :project

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
