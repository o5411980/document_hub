class AddProductRefToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :product, foreign_key: true
  end
end
