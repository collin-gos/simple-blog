after "development:articles" do
  puts "Creating articles...."
  articles = Article.all
  50.times do
    Comment.create(
      commenter: Faker::Name.name,
      body: Faker::Lorem.sentence(word_count: 12),
      visible: Visible::VALID_VISIBLE.sample,
      article: articles.sample
    )
  end
end
