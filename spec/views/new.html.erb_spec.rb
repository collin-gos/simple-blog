require "rails_helper"

RSpec.describe "articles/new" do
  before do
    assign(:article, Article.new)
    render
  end

  it "have all filed" do
    expect(rendered).to have_selector("form")
    expect(rendered).to have_selector("input[name='article[title]']")
    expect(rendered).to have_selector("textarea[name='article[body]']")
    expect(rendered).to have_selector("select[name='article[visible]']")
    expect(rendered).to have_selector("input[type='submit']")
  end
end
