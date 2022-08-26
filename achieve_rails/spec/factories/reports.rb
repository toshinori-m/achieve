FactoryBot.define do
  factory :report do
    user_id { 1 }
    location { "新居浜河川敷" }
    time { "18:45〜19:45" }
    condition { "好調" }
    intensity { "少し厳しい" }
    point { "5分45秒/kmペースで10km" }
    report { "お盆なので残暑は続いているが、練習を継続する。" }
  end
end