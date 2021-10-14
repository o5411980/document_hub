class AddProjectRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :project, foreign_key: true
  end
end
