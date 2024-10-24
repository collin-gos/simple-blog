FactoryBot.define do
  factory :approved_article, class: Article do
    title { "Factory article" }
    body { "This is a sample aritcle content."}
    association :user
    visible { "public" }
    status { 1 }
  end
end
