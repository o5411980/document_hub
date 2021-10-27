class Review < ApplicationRecord
  belongs_to :product
  belongs_to :project

  has_many :reviewers, dependent: :destroy
  has_many :reviewer_users, through: :reviewers, source: :user

  has_many :review_documents, dependent: :destroy
  has_many :review_document_documents, through: :review_documents, source: :document

  enum stage: {'Review 1': 1, 'Review 2': 2, 'Review 3': 3}
  enum judge: {'未承認': false, '承認済': true}

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date_on.present? && date_on < Date.today
      errors.add(:expiration_date, ": 過去の日付は使えません")
    end

    if deadline.present? && deadline < Date.today
      errors.add(:expiration_date, ": 過去の日付は使えません")
    end
  end


end
