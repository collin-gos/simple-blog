class UpdateRelationToUser < ActiveRecord::Migration[7.2]
  # Reverse change
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :articles, :user, null: false, foreign_key: true
  end
end
