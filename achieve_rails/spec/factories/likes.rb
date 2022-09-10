FactoryBot.define do
  factory :like do
    association :user
    association :message
  end
end