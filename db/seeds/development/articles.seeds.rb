after :common do
  puts "Creating articles...."
  30.times do
    Article.create(title: Faker::Fantasy::Tolkien.poem,
                    body: Faker::Lorem.paragraph(sentence_count: 10, supplemental: true),
                    visible: Visible::VALID_VISIBLE.sample)
  end
end
