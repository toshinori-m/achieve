require 'rails_helper'

RSpec.describe "Reports", type: :request do
  let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password') }
  let(:token) { sign_in user }
  let(:json) { JSON.parse(response.body) }

  describe 'report /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'Reportを作成すると、Reportが追加される' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { Report.create(report: 'test1',point: 'test2',location: 'test3',time: 'test4',condition: 'test5',intensity: 'test6',datepicker_value: 'test7', user_id: user.id) }.to change{Report.count}.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、Reportが追加されない' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { Report.create(report: '',point: 'test2',location: 'test3',time: 'test4',condition: 'test5',intensity: 'test6',datepicker_value: 'test7', user_id: user.id) }.to change{Report.count}.by(0)
      end
    end
  end

  describe 'report /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'Reportの新しい目標を取得(status200 を返す)' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        reports = Report.where("user_id = '1'")
      expect(response.status).to eq (200)
      end
    end
    
    context 'paramsの値が正しくない場合表示失敗' do
      it 'reportの目標を取得出来ない(status401 を返す)' do
        post '/auth/sign_in', params: { email: '', password: '' }
        reports = Report.where("user_id = '1'")
      expect(response.status).to eq (401)
      end
    end
  end
end