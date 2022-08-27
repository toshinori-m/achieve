require 'rails_helper'

RSpec.describe "Goals", type: :request do
  let(:headers) do
    { uid: headers['uid'], client: headers['client'],'access-token': headers['access-token'] }
    # { uid: response.headers['uid'], client: response.headers['client'],'access-token': response.headers['access-token'] }
  end

  let(:json) { JSON.parse(response.body) }
  
  describe "POST /create" do
    context 'userとしてログインしている場合' do
      let(:correct_post) { post "/achieve_rails/", params: user_params, headers: headers }
      # let(:goal) { create(:goal) }
      # let(:goal) { create(:goal) }
        # before do
        #   @user = FactoryBot.create(:user)
        #   @goal = FactoryBot.create(:goal, user_id: @user[:id])
        # end
      # before do
      #   post "/goals", params: { aim: [:aim] },
      #   # post "/goals", params: { params: FactoryBot.goal(:aim) },
      #   headers: headers
      # end
      
      it 'ステータス200を返す' do
        expect(response.status).to eq(201)
      end
    end
  end
end
