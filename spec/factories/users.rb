FactoryBot.define do
  factory :user, class: User do
    email { "user@example.com" }
    password { "password123" }
  end
end
