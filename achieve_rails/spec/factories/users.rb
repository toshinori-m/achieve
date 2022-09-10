FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "example_#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testuser" }

    factory :guest do
      name { "guest" }
      email { "guest@example.com" }
    end
  end
end