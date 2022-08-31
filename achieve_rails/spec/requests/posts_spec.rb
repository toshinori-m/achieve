require 'rails_helper'

RSpec.describe 'POST /create' , type: :request do
  let!(:user) { User.new(name: 'example_user', email: 'example_user', password: 'password')  }
  # let!(:user) { { name: 'toshi', email: 'toshi@example.com', password: 'toshinori' } }
  # let!(:user) { { name: 'toshi', email: 'toshi@example.com', password: '$2a$12$GEFXoGMeYO/lofsCnJ8rOOlVPICWQjcbXm4SS9I7oWGDGM5yZfZVm' } }
  # let!(:user) { { name: 'example_user', email: 'example_user', password: 'password' } }
  # let!(:post_params) { { name: 'example', email: 'test1@example.com', password: 'password' } }
  # let!(:user) { { name: 'example', email: 'test1@example.com', password: '$2a$04$/aEDaSBa4rCw9LGL.mI2v.xiK92dJ.0D8DwRtycyqfrr1iYiV.oiy' } }
  # let(:post_params) { { aim: 'フルマラソン完走するぞ！' } }
  # let(:post_params){ { name: 'guest', email: 'guest@example.com', password: 'guests' } }
  # let(:post_params){ { name: 'toshi', email: 'toshi@example.com', password: 'toshinori' } }
  # let(:token) { sign_in post_params }
  let(:token) { sign_in user }

  before do
    post '/auth/sign_in',  headers: token
    # post '/auth/sign_in', params: { post: post_params }, headers: token
  end

  it 'ステータスコード200が返ってくる' do
    # expect(user).to be_valid
    expect(response.status).to eq 200
  end
  # before do
  #   post '/auth', params: { post: post_params }, headers: token
  # end

  # it 'ステータスコード422が返ってくる（処理ができないもの）' do
  #   expect(response.status).to eq 422
  # end
  # before do
  #   post '/auth/sign_in', params: { post: post_params }, headers: token
  # end

  # it 'ステータスコード401が返ってくる（認証失敗）' do
  #   expect(response.status).to eq 401
  # end
end