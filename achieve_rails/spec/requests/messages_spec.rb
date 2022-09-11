require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let!(:user) { create(:user) }
  let!(:message) { create(:message) }
  let(:params) { { email: user.email, password: user.password } }
  let(:token) { sign_in user }
  
  describe 'Message /# index' do
    context 'paramsの値が正しい場合表示成功' do
      it 'Messageの一覧をを取得(status200 を返す)' do
        get'/messages',  headers: token
        post'/auth/sign_in', params: params, headers: token
        expect(response.status).to eq (200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.size).to eq 1
      end
      
      it 'Messageの特定の投稿を取得(status200 を返す)' do
        get'/messages#(message.id)',  headers: token
        post'/auth/sign_in', params: params, headers: token
        expect(response.status).to eq (200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body["data"]["id"]).to eq message.id
      end
    end
  end
end

