
3.times do |number|
  Report.create(
  report: "#{number}番目のメッセージです！", 
  point: "#{number}番目のメッセージです！", 
  location: "#{number}番目のメッセージです！", 
  time: "#{number}番目のメッセージです！", 
  condition: "#{number}番目のメッセージです！", 
  intensity: "#{number}番目のメッセージです！", 
  user_id: User.first.id)
  puts "#{number}番目のメッセージを作成しました"
end

puts "メッセージの作成が完了しました"