module AuthorizationHelper
  def sign_in(user)
    # post '/auth/sign_in', params: { email: "guest@example.com", password: "guests" }
    # post '/auth/sign_in', params: { email: "toshi@gmail.com", password: "toshinori" }
    # post '/auth/sign_in', params: { email: "toshi@gmail.com", password: "toshinori" }
    # post '/auth/sign_in', params: { email: user.email, password: user.password }
    # post '/auth/sign_in', params: { email: user[:email], password: user[:password] },as: :json
    # post '/auth/sign_in', params: { email: "2@gmail.com", password: "toshinori" }
    post '/auth/sign_in', params: { email: "test1@example.com", password: "password" }
    # post posts_path, params: { email: user.email, password: user.password }
    
    response.headers.slice('client', 'access-token', 'uid')
    # response.headers.slice('client', 'uid', 'token-type', 'access-token')
  end
end