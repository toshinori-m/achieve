class PingController < ApplicationController
  def index
    result = Rails.application.config.redis.ping
    render json: { status: 'success', message: result }, status: :ok
  rescue StandardError => e
    render json: { status: 'error', message: e.message }, status: :internal_server_error
  end
end
