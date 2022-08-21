class MonthlyGoalsController < ApplicationController
  before_action :authenticate_user!

  def create
    monthly_goals = MonthlyGoal.new(aim: params[:aim], user_id: current_user.id)
    if monthly_goals.save
      render json: { id: monthly_goals.id, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: monthly_goals.errors.messages }, status: :bad_request
    end
  end

  def index
    monthly_goals = MonthlyGoal.where("user_id = #{current_user.id}").order(id: "ASC").last(1)
    monthly_goals_array = monthly_goals.map do |monthly_goal|
      {
        id: monthly_goal.id,
        user_id: monthly_goal.user_id,
        name: monthly_goal.user.name,
        aim: monthly_goal.aim,
        email: monthly_goal.user.email,
        created_at: monthly_goal.created_at
      }
    end
    render json: monthly_goals_array, status: 200
  end

  private
  def monthly_goals_params
    params.require(:monthly_goal).permit(:aim)
  end
end
