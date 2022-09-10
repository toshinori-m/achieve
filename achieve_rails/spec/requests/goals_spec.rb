require 'rails_helper'

RSpec.describe "Goals", type: :request do
  let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password') }
  let(:token) { sign_in user }
  let(:json) { JSON.parse(response.body) }

  describe 'goal /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'Goalを作成すると、Goalが追加される' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { Goal.create(aim: 'test', user_id: 'user.id') }.to change{Goal.count}.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、Goalが追加されない' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { Goal.create(aim: ' ', user_id: user.id) }.to change{Goal.count}.by(0)
      end
    end
  end

  describe 'goal /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'Goalの新しい目標を取得(status200 を返す)' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        goals = Goal.where("user_id = '1'").order(id: 'ASC').last(1)
        goals_array = goals.map do |goal|
          {
            id: goal.id,
            user_id: goal.user_id,
            name: goal.user.name,
            aim: goal.aim,
            email: goal.user.email,
            created_at: goal.created_at
          }
        end
      expect(response.status).to eq (200)
      end
    end
    
    context 'paramsの値が正しくない場合表示失敗' do
      it 'Goalの目標を取得出来ない(status401 を返す)' do
        post '/auth/sign_in', params: { email: '', password: '' }
        goals = Goal.where("user_id = '1'").order(id: 'ASC').last(1)
        goals_array = goals.map do |goal|
          {
            id: goal.id,
            user_id: goal.user_id,
            name: goal.user.name,
            aim: goal.aim,
            email: goal.user.email,
            created_at: goal.created_at
          }
        end
      expect(response.status).to eq (401)
      end
    end
  end
end