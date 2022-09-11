FactoryBot.define do
  factory :message do
    content { "test1" }
    association :user
  end
end
