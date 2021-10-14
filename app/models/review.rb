class Review < ApplicationRecord
  belongs_to :product
  belongs_to :project

  enum stage: {'Review 1': 1, 'Review 2': 2, 'Review 3': 3}
  enum judge: {'未承認': false, '承認済': true}
end
