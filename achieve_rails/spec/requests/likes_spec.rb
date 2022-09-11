require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let!(:user) { create(:user) }
  let!(:target_message) { create(:message) }
  let(:token) { sign_in user }

  describe 'like /#create' do
  subject(:request) { Like.create(params) }
    context 'paramsの値が正しい場合作成成功' do
      let(:params) { { user_id: user.id, message_id: target_message.id } }
      it 'Likeを作成すると、Likeが追加される' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { request }.to change{Like.count}.by(+1)
      end
    end
    context 'paramsの値が正しくない場合作成失敗' do
      let(:params) { { user_id: nil, message_id: target_message.id } }
      it 'Likeを作成しても、Likeが追加出来ない' do
        post '/auth/sign_in', params: { email: user.email, password: user.password }, headers: token
        expect { request }.to change{Like.count}.by(0)
      end
    end
  end
  
  describe 'like /#destroy' do
    let!(:like) { create(:like) }
    context 'paramsの値が正しい場合削除成功' do
      it 'Likeを見つけると、Likeが削除される' do
        expect { like.destroy }.to change{Like.count}.by(-1)
      end
      it 'Likeが削除されると、status200 を返す' do
        delete "/likes/#{like.id}"
        expect(response.status).to eq (200)
      end
    end
  end
end