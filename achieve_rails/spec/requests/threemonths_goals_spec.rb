require 'rails_helper'

RSpec.describe 'ThreemonthsGoals', type: :request do
  let!(:user) { create(:user) }
  let!(:threemonths_goal) { create(:threemonths_goal) }
  let(:token) { sign_in user }
  let(:params) { { email: user.email, password: user.password } }

  describe 'threemonths_goal /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'ThreemonthsGoalを作成すると、ThreemonthsGoalが追加される' do
        post '/auth/sign_in', params: params, headers: token
        expect { ThreemonthsGoal.create(aim: 'test', user_id: user.id) }.to change { ThreemonthsGoal.count }.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、ThreemonthsGoalが追加されない' do
        post '/auth/sign_in', params: params, headers: token
        expect { ThreemonthsGoal.create(aim: ' ', user_id: user.id) }.to change { ThreemonthsGoal.count }.by(0)
      end
    end
  end

  describe 'threemonths_goal /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'ThreemonthsGoalの一覧の値を取得(status200 を返す)' do
        get '/threemonths_goals', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.size).to eq 1
      end

      it 'ThreemonthsGoalの特定の値を取得(status200 を返す)' do
        get '/threemonths_goals#(threemonths_goal.id)', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['data']['id']).to eq threemonths_goal.id
      end
    end

    context 'ThreemonthsGoalの値が正しくない場合表示失敗' do
      it 'Goalの目標を取得出来ない(status401 を返す)' do
        get '/threemonths_goals'
        post '/auth/sign_in', params: { email: '', password: '' }
        expect(response.status).to eq(401)
      end
    end
  end
end
