after "development:users" do
  puts "Creating articles...."
  users = User.all
  30.times do
    Article.create(title: Faker::Fantasy::Tolkien.poem,
                    body: Faker::Lorem.paragraph(sentence_count: 10, supplemental: true),
                    visible: Visible::VALID_VISIBLE.sample,
                    user: users.sample )
  end
end
