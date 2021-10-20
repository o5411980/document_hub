class Review < ApplicationRecord
  belongs_to :product
  belongs_to :project

  has_many :reviewers, dependent: :destroy
  has_many :reviewer_users, through: :reviewers, source: :user

  has_many :review_documents, dependent: :destroy
  has_many :review_document_documents, through: :review_documents, source: :document

  enum stage: {'Review 1': 1, 'Review 2': 2, 'Review 3': 3}
  enum judge: {'未承認': false, '承認済': true}
end
