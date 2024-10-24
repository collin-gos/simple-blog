require 'rails_helper'

RSpec.describe "articles/index" do
  context "with 3 articles" do
    before do
      user = FactoryBot.create(:user)
      assign(:articles, create_list(:approved_article, 3, user: user))
      render
    end

    it "have all articles's title" do
      Article.all.each do |article|
        expect(rendered).to match(article.title)
      end
    end
    it "have all link to article details" do
      Article.all.each do |article|
        expect(rendered).to have_link("Read", href: article_path(article))
      end
    end

  end
end
