class ReviewDocument < ApplicationRecord
  belongs_to :document
  belongs_to :review

  validates :document_id, presence: true
end
