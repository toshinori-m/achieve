FactoryBot.define do
  factory :report do
    user_id { 1 }
    location { 'test1' }
    time { 'test2' }
    condition { 'test3' }
    intensity { 'test4' }
    point { 'test5' }
    report { 'test6' }
  end
end
