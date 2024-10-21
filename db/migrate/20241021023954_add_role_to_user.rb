class AddRoleToUser < ActiveRecord::Migration[7.2]
  def change
    # User: 0, Admin: 1
    add_column :users, :role, :integer, default: 0
  end
end
