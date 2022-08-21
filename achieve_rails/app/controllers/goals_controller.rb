class GoalsController < ApplicationController
  before_action :authenticate_user!

  def create
    goals = Goal.new(aim: params[:aim], user_id: current_user.id)
    if goals.save
      render json: { id: goals.id, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: goals.errors.messages }, status: :bad_request
    end
  end

  def index
    goals = Goal.where("user_id = #{current_user.id}").order(id: "ASC").last(1)
    goals_array = goals.map do |goal|
      {
        id: goal.id,
        user_id: goal.user_id,
        name: goal.user.name,
        aim: goal.aim,
        email: goal.user.email,
        created_at: goal.created_at
      }
    end
    render json: goals_array, status: 200
  end

  private
  def goals_params
    params.require(:goal).permit(:aim)
  end
end
