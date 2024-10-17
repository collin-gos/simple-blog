class AddVisibleToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :visible, :string
  end
end
