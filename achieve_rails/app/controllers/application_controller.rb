class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def options_preflight
    head :ok
  end
end
