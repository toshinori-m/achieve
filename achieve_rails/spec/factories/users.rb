FactoryBot.define do
  factory :user do
    name { "example" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testuser" }

    factory :guest do
      name { "guest" }
      email { "guest@example.com" }
    end
  end
end