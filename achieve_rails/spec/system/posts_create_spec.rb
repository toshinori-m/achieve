require 'rails_helper'
RSpec.describe 'PostsController', type: :system do
  describe '#create' do
  let(:user) { build(:user) }
    context '正しい情報を入力' do
      before do
        ActionMailer::Base.deliveries.clear
        visit '/auth/sign_in'
        fill_in 'ユーザー名',	with: user.name
        fill_in 'メールアドレス',	with: user.email
        fill_in 'パスワード',	with: user.password
        fill_in 'パスワード（確認）',	with: user.password
      end
      it  'ユーザー数が増える' do
        expect { click_on '登録' }.to change { Post.count }.by(1)
      end
    end
  end
end