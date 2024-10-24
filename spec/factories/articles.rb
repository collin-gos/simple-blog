FactoryBot.define do
  factory :approved_article, class: Article do
    sequence(:title) { |n| "Approved Title #{n}" }
    body { "This is a sample aritcle content."}
    association :user
    visible { "public" }
    status { 1 }
  end
end

FactoryBot.define do
  factory :pending_articles, class: Article do
    sequence(:title) { |n| "Pending title #{n}" }
    body { "This is a sample article content." }
    association :user
    visible { "public" }
    status { 1 }
  end
end
