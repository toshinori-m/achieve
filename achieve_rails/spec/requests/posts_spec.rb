require 'rails_helper'
RSpec.describe 'POST /create', type: :request do
  let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password',password_confirmation: 'password') }
  let(:token) { sign_in user }
  let(:params) { { email: user.email, password: user.password } }
  
  context 'paramsの値が正しい場合作成成功' do
    it 'userを保存できると、userが増える' do
      post '/auth'
      expect { User.create(name: 'example1', email: 'test2@example.com', password: 'password',password_confirmation: 'password')}.to change {User.count}.by(+1)
    end
  end

  context 'paramsの値が正しくない場合作成出来ない' do
    it '既に登録されているemailならuser登録に失敗し、userが増えない' do
      post '/auth'
      expect { User.create(name: 'example1', email: 'test1@example.com', password: 'password',password_confirmation: 'password')}.to change {User.count}.by(0)
    end

    it 'paramsの値が不十分な場合user登録に失敗し、userが増えない' do
      post '/auth'
      expect { User.create(name: '', email: 'test2@example.com', password: 'password',password_confirmation: 'password')}.to change {User.count}.by(0)
    end
  end

  context 'ログイン成功' do
    it 'status200が返ってくる' do
      post '/auth/sign_in', params: params, headers: token
      expect(response.status).to eq(200)
    end
  end

  context 'ログイン失敗' do
    it '誤ったemailを入力したstatus401が返ってくる' do
      post '/auth/sign_in', params: { email: 'test@test.com', password: user.password }, headers: token
      expect(response.status).to eq(401)
    end

    it '誤ったpasswordを入力したstatus401が返ってくる' do
      post '/auth/sign_in', params: { email: user.email, password: 'test1' }, headers: token
      expect(response.status).to eq(401)
    end
  end

  context 'ログアウト成功' do
    it 'status200が返ってくる' do
      delete '/auth', params: params, headers: token
      expect(response.status).to eq(200)
    end
  end

  context 'ログアウト失敗' do
    it '未ログインの場合status404が返ってくる' do
      delete '/auth', params: { email: '', password: '' }
      expect(response.status).to eq(404)
    end
  end
end
