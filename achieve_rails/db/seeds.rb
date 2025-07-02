guest_user = User.find_or_initialize_by(email: 'guest@example.com')
guest_user.assign_attributes(
  uid: 'guest_uid',
  password: 'password123',
  name: 'ゲストユーザー'
)
guest_user.save!

puts "ゲストユーザー：#{guest_user.email} を作成しました"

# ダミーレポート作成（既存処理）
3.times do |number|
  Report.create!(
    report: "#{number}番目のメッセージです！",
    point: "#{number}番目のメッセージです！",
    location: "#{number}番目のメッセージです！",
    time: "#{number}番目のメッセージです！",
    condition: "#{number}番目のメッセージです！",
    intensity: "#{number}番目のメッセージです！",
    user_id: guest_user.id
  )
  puts "#{number}番目のメッセージを作成しました"
end

puts 'メッセージの作成が完了しました'
