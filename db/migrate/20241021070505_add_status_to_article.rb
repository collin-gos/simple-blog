class AddStatusToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :status, :integer, null: false, default: 0

    vals = [-1, 0, 1]
    Article.find_each do |a|
      a.update(status: vals.sample)
    end

  end
end
