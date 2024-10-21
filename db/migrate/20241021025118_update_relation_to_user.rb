class UpdateRelationToUser < ActiveRecord::Migration[7.2]
  # # Apply changes
  # def up
  #   # Temporary null
  #   add_reference :comments, :users, null: true, foreign_key: true
  #   add_reference :articles, :users, null: true, foreign_key: true

  #   # Update users
  #   user_ids = User.pluck(:id)

  #   Article.find_each do |article|
  #     article.update!(:user_id, user_ids.sample)
  #   end

  #   Comment.find_each do |comment|
  #     comment.update!(user_id: user_ids.sample)
  #   end

  #   # change_column_null :articles, :user_id, false
  #   # change_column_null :comments, :user_id, false
  # end

  # Reverse change
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :articles, :user, null: false, foreign_key: true
  end
end
