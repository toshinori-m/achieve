require 'rails_helper'

RSpec.describe 'POST /create' do
  let!(:user) { { name: 'example_user', email: 'example@example.com', password: 'passward' } }
  let(:post_params) { { content: 'example_content' } }
  let(:token) { sign_in user }

  before do
    # sign_in user
    # post posts_path, params: { post: post_params }
    # post posts_path, params: { post: post_params }, headers: token
    post auth_path, params: { post: post_params }, headers: token
    # post auth_sign_in_path, params: { post: post_params }, headers: token
    # post auth_registrations_path, params: { post: post_params }, headers: token
  end

  it 'ステータスコード200が返ってくる' do
    expect(response.status).to eq 200
  end
end