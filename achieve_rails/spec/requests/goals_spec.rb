require 'rails_helper'

RSpec.describe "Goals", type: :request do
  # let(:user) { create(:user) }
  # let(:user_params) { attributes_for(:user) }
  # let(:invalid_user_params) { attributes_for(:user, name: "") }
  # let(:headers) do
  #   # { uid: headers['uid'], client: headers['client'],'access-token': headers['access-token'] }
  #   { uid: response.headers['uid'], client: response.headers['client'],'access-token': response.headers['access-token'] }
  # end
  # let(:json) { JSON.parse(response.body) }
  
  # describe "POST /create" do
  #   # goal = FactoryBot.create(:goal) 
  #   FactoryBot.create(:user)
  #   goal = FactoryBot.build(:goal)
  #   post "/goals", params: {
  #     goal: {
  #       user_id: goal.user_id,
  #       headers: headers,
  #       params: aim,
  #     },
  #     during_spots: [date_spot.id, other_spot.id],
  #   }
  #   # let!(:aim) { FactoryBot.create(:aim) }
  #   # before do
  #   #   @user = FactoryBot.create(:user)
  #   #   @aim = FactoryBot.create(goal:aim, user_id: @user[:id])
  #   # end
  #   # let!(:aim) { create(:aim) }
  #   # context 'ログインしている場合' do
  #     # let(:correct_post) { post "/goals", params: aim, headers: headers, user_id: current_user.id }
  #     # let(:goal) { create(:goal) }
  #     # let(:goal) { create(:goal) }
  #       # before do
  #       #   @user = FactoryBot.create(:user)
  #       #   @goal = FactoryBot.create(:goal, user_id: @user[:id])
  #       # end
  #     # before do
  #     #   post "/goals", params: { aim: [:aim] },
  #     #   # post "/goals", params: { params: FactoryBot.goal(:aim) },
  #     #   headers: headers
  #     # end
      
  #     it 'ステータス200を返す' do
  #       correct_post
  #       # expect(response).to eq(nil)
  #       expect(response.status).to eq(201)
  #     end
  #   # end
  # end
  
  describe "GET /index" do
    subject { get index_goal_registration_path }
    it "非ログイン時のテスト（認証失敗）" do
      # user.id = FactoryBot.attributes_for(:goal_enquete)
      # goals = Goal.where("user_id = uid").order(id: 'ASC').last(1)
      # goal = Goal.where("user_id = 1").order(id: 'ASC').last(1)
      # goal = Goal.where{"FactoryBot"}.order(id: 'ASC').last(1)
      # goal = FactoryBot.create(:goal)
      get "/goals"
        # goal: {
        #   id: goal.id,
        #   user_id: goal.user_id,
        #   name: goal.user.name,
        #   aim: goal.aim,
        #   email: goal.user.email,
        #   created_at: goal.created_at,
        #   # headers: headers
        # }
        expect(response.status).to eq(401)
    end

  #   context 'ログインしている場合' do
  #     before do
  #       user.confirm
  #       sign_in user
  #     end
  #     it 'リクエストが成功すること' do
  #       is_expected.to eq 200
  #     end
  #   end
  #   # context 'ゲストの場合' do
  #   #   it 'リダイレクトされること' do
  #   #     is_expected.to redirect_to new_user_session_path
  #   #   end
  #   # end
  # it "responds successfully" do
  #   get "/goals"
  #   expect(response).to be_success
  # end
  # # 200レスポンスが返ってきているか？
  # it "returns a 200 response" do
  #   get "/goals"
  #   expect(response).to have_http_status "200"
  # end
  # it 'ログインしている場合' do
  #   # 下記の２行を追加する
  #   # DBに下記user情報のuserが存在している前提
  #   user = { email: "2@gmail.com", password: "toshinori" }
  #   auth_tokens = sign_in(user)

  #   params = {
  #     goal: {
  #       aim: "達成です", 
  #     }
  #   }

  #   # headersを追加
  #   post goals_path, params: params, headers: auth_tokens

  #   expect(response).to have_http_status :ok
  # end
  end
end
