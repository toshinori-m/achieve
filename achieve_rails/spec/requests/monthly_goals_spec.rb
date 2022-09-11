require 'rails_helper'

RSpec.describe 'MonthlyGoals', type: :request do
  let!(:user) { create(:user) }
  let!(:monthly_goal) { create(:monthly_goal) }
  let(:token) { sign_in user }
  let(:params) { { email: user.email, password: user.password } }

  describe 'monthly_goal /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'MonthlyGoalを作成すると、MonthlyGoalが追加される' do
        post '/auth/sign_in', params: params, headers: token
        expect { MonthlyGoal.create(aim: 'test', user_id: user.id) }.to change { MonthlyGoal.count }.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、MonthlyGoalが追加されない' do
        post '/auth/sign_in', params: params, headers: token
        expect { MonthlyGoal.create(aim: ' ', user_id: user.id) }.to change { MonthlyGoal.count }.by(0)
      end
    end
  end

  describe 'monthly_goal /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'MonthlyGoalの一覧の値を取得(status200 を返す)' do
        get '/monthly_goals', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.size).to eq 1
      end

      it 'MonthlyGoalの特定の値を取得(status200 を返す)' do
        get '/monthly_goals#(monthly_goal.id)', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['data']['id']).to eq monthly_goal.id
      end
    end

    context 'paramsの値が正しくない場合表示失敗' do
      it 'MonthlyGoalの目標を取得出来ない(status401 を返す)' do
        get '/monthly_goals'
        post '/auth/sign_in', params: { email: '', password: '' }
        expect(response.status).to eq(401)
      end
    end
  end
end
