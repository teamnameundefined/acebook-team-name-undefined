FactoryBot.define do
  factory :comment do
    name { "MyString" }
    body { "MyText" }
    user { nil }
    post { nil }
  end

  factory :user do
    email { "1234@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :post do
    message { "message" }
    # post_id { 1 }
  end
end