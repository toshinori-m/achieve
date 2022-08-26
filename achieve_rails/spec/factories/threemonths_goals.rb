FactoryBot.define do
  factory :threemonths_goal do
      user_id { 1 }
      aim { "マラソンを意識した３０kmペースとロングインターバル走を取り入れる。" }
      # aim { "スピード練習に特化して身体のエンジンをバージョンアップする。" }
      # aim { "スピード養成と筋トレに専念し、筋肉への負荷を上げる。短時間の練習を集中する。" }
      # aim { "少し遅らせた設定ペースでオッケーなので３０km走を月に１〜２回取り入れる。" }
  end
end
