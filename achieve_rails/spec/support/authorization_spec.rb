module AuthorizationHelper
  def sign_in(user)
    post '/auth/sign_in', params: { email: "test1@example.com", password: "password" }
    
    response.headers.slice('client', 'access-token', 'uid')
  end
end