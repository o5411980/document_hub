class User < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :member_departments, through: :members, source: :department

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
