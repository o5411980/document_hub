class ChangeDepartmentLeadersToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_table :department_leaders, :members
  end
end
