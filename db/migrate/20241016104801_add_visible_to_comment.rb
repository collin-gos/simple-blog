class AddVisibleToComment < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :visible, :string
  end
end
