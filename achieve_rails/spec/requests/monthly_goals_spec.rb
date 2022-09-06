require 'rails_helper'

RSpec.describe "MonthlyGoals", type: :request do
  let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password') }
  let(:token) { sign_in user }
  let(:json) { JSON.parse(response.body) }

  describe 'monthly_goal /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'MonthlyGoalを作成すると、MonthlyGoalが追加される' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { MonthlyGoal.create(aim: 'test', user_id: user.id) }.to change{MonthlyGoal.count}.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、MonthlyGoalが追加されない' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { MonthlyGoal.create(aim: ' ', user_id: user.id) }.to change{MonthlyGoal.count}.by(0)
      end
    end
  end

  describe 'monthly_goal /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'MonthlyGoalの新しい目標を取得(status200 を返す)' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        monthly_goals = MonthlyGoal.where("user_id = '1'").order(id: 'ASC').last(1)
        monthly_goals_array = monthly_goals.map do |monthly_goal|
          {
            id: monthly_goal.id,
            user_id: monthly_goal.user_id,
            name: monthly_goal.user.name,
            aim: monthly_goal.aim,
            email: monthly_goal.user.email,
            created_at: monthly_goal.created_at
          }
        end
      expect(response.status).to eq (200)
      end
    end
    
    context 'paramsの値が正しくない場合表示失敗' do
      it 'MonthlyGoalの目標を取得出来ない(status401 を返す)' do
        post '/auth/sign_in', params: { email: '', password: '' }
        monthly_goals = MonthlyGoal.where("user_id = '1'").order(id: 'ASC').last(1)
        monthly_goals_array = monthly_goals.map do |monthly_goal|
          {
            id: monthly_goal.id,
            user_id: monthly_goal.user_id,
            name: monthly_goal.user.name,
            aim: monthly_goal.aim,
            email: monthly_goal.user.email,
            created_at: monthly_goal.created_at
          }
        end
      expect(response.status).to eq (401)
      end
    end
  end
end