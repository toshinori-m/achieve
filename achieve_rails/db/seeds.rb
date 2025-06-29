# ユーザーが存在しない場合に作成する
user = User.first || User.create!(
  uid: 'dummy_uid',
  email: 'test@example.com',
  password: 'password123',
  name: 'テストユーザー'
)

3.times do |number|
  Report.create!(
    report: "#{number}番目のメッセージです！",
    point: "#{number}番目のメッセージです！",
    location: "#{number}番目のメッセージです！",
    time: "#{number}番目のメッセージです！",
    condition: "#{number}番目のメッセージです！",
    intensity: "#{number}番目のメッセージです！",
    user_id: user.id
  )
  puts "#{number}番目のメッセージを作成しました"
end
