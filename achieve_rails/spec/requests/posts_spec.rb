require 'rails_helper'
RSpec.describe 'POST /create', type: :request do
  let(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password') }
  let(:token) { sign_in user }
  let(:params) { { email: user.email, password: user.password } }

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

  context '未ログイン状態で登録urlへアクセス失敗' do
    routes = ['/home', '/training', '/record_page']
    detailed_routes = Rails.application.routes.routes
    route_paths = detailed_routes.map { |route| ActionDispatch::Routing::RouteWrapper.new(route) }.map(&:path)
    it 'status401を返す' do
      for i in routes do
        if route_paths === i
          post '/auth/sign_in', params: params, headers: token
          expect(response.status).to eq(200)
        else
          post '/auth/sign_in', params: { email: '', password: '' }
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
