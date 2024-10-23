require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create_article_sucessfully" do
    assert Article.create(title: "This is title", body: "This description")
  end
end
