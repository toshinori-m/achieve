require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let!(:user) { create(:user) }
  let!(:report) { create(:report) }
  let(:token) { sign_in user }
  let(:params) { { email: user.email, password: user.password } }

  describe 'report /#create' do
    context 'paramsの値が正しい場合作成成功' do
      it 'Reportを作成すると、Reportが追加される' do
        post '/auth/sign_in', params: params, headers: token
        expect do
          Report.create(report: 'test1', point: 'test2', location: 'test3', time: 'test4', condition: 'test5',
                        intensity: 'test6', datepicker_value: 'test7', user_id: user.id)
        end.to change {
                Report.count
              }.by(+1)
      end
    end

    context 'paramsの値が正しくない場合作成出来ない' do
      it 'params(aim)の値が空の場合、Reportが追加されない' do
        post '/auth/sign_in', params: params, headers: token
        expect do
          Report.create(report: '', point: 'test2', location: 'test3', time: 'test4', condition: 'test5', intensity: 'test6',
                        datepicker_value: 'test7', user_id: user.id)
        end.to change {
                Report.count
              }.by(0)
      end
    end
  end

  describe 'report /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'Reportの一覧の値を取得(status200 を返す)' do
        get '/reports', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.size).to eq 1
      end

      it 'Reportの特定の値を取得(status200 を返す)' do
        get '/reports#(report.id)', headers: token
        post '/auth/sign_in', params: params, headers: token
        expect(response.status).to eq(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['data']['id']).to eq report.id
      end
    end

    context 'Reportの値が正しくない場合表示失敗' do
      it 'Goalの目標を取得出来ない(status401 を返す)' do
        get '/reports'
        post '/auth/sign_in', params: { email: '', password: '' }
        expect(response.status).to eq(401)
      end
    end
  end
end
