module AuthorizationHelper
  def sign_in(user)
    post posts_path, params: { email: user.email, password: user.password }
    
    response.headers.slice('client', 'uid', 'token-type', 'access-token')
  end
end