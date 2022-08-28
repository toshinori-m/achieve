require 'rails_helper'

RSpec.describe "Goals", type: :request do
  let(:headers) do
    # { uid: headers['uid'], client: headers['client'],'access-token': headers['access-token'] }
    { uid: response.headers['uid'], client: response.headers['client'],'access-token': response.headers['access-token'] }
  end
  let(:json) { JSON.parse(response.body) }
  
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

    it "ログイン時のテスト" do
      get "/goals"
        expect(response.status).to eq(401)
    end
  end
end
