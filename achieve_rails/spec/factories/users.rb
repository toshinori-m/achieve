FactoryBot.define do
  factory :user do
    name { "example user" }
    email { "foo@bar.com" }
    password { "foobar123" }
    password_confirmation { "foobar123" }

    factory :guest do
      name { "guest" }
      email { "guest@example.com" }
    end
  end
end