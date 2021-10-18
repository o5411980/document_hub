class AddLeaderColumnToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :leader, :integer
  end
end
