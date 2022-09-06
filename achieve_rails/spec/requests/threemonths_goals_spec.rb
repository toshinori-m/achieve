require 'rails_helper'

RSpec.describe "ThreemonthsGoals", type: :request do
  let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password') }
  let(:token) { sign_in user }
  let(:json) { JSON.parse(response.body) }

  describe 'threemonths_goal /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'ThreemonthsGoalを作成すると、ThreemonthsGoalが追加される' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { ThreemonthsGoal.create(aim: 'test', user_id: user.id) }.to change{ThreemonthsGoal.count}.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、ThreemonthsGoalが追加されない' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { ThreemonthsGoal.create(aim: ' ', user_id: user.id) }.to change{ThreemonthsGoal.count}.by(0)
      end
    end
  end

  describe 'threemonths_goal /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'ThreemonthsGoalの新しい目標を取得(status200 を返す)' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        threemonths_goals = ThreemonthsGoal.where("user_id = '1'").order(id: 'ASC').last(4)
        threemonths_goals_array = threemonths_goals.map do |threemonths_goal|
          {
            id: threemonths_goal.id,
            user_id: threemonths_goal.user_id,
            name: threemonths_goal.user.name,
            aim: threemonths_goal.aim,
            email: threemonths_goal.user.email,
            created_at: threemonths_goal.created_at
          }
        end
      expect(response.status).to eq (200)
      end
    end
    
    context 'paramsの値が正しくない場合表示失敗' do
      it 'ThreemonthsGoalの目標を取得出来ない(status401 を返す)' do
        post '/auth/sign_in', params: { email: '', password: '' }
        threemonths_goals = ThreemonthsGoal.where("user_id = '1'").order(id: 'ASC').last(4)
        threemonths_goals_array = threemonths_goals.map do |threemonths_goal|
          {
            id: threemonths_goal.id,
            user_id: threemonths_goal.user_id,
            name: threemonths_goal.user.name,
            aim: threemonths_goal.aim,
            email: threemonths_goal.user.email,
            created_at: threemonths_goal.created_at
          }
        end
      expect(response.status).to eq (401)
      end
    end
  end
end