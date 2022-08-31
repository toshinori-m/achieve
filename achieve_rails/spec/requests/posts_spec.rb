# require 'rails_helper'

# RSpec.describe 'POST /create' , type: :request do
#   let!(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password')  }
#   let(:token) { sign_in user }

#   before do
#     post '/auth/sign_in',  headers: token
#   end

#   it 'ステータスコード200が返ってくる' do
#     expect(response.status).to eq 200
#   end
# end
require 'rails_helper'
RSpec.describe 'POST /create' , type: :request do
  let(:user) { User.create(name: 'example', email: 'test1@example.com', password: 'password')  }

  it 'ステータスコード200が返ってくる' do
    post '/auth/sign_in', params: { email: user.email, password: user.password }
    expect(response.status).to eq 200
  end
end