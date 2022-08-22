class ThreemonthsGoalsController < ApplicationController
  before_action :authenticate_user!

  def create
    aims = [params[:aim_1], params[:aim_2], params[:aim_3], params[:aim_4]]
    for i in 0..3 do
      threemonths_goals_params = ThreemonthsGoal.new(aim: aims[i], quarter: i, user_id: current_user.id)
      quarters = threemonths_goals_params
      if quarters.save
        render json: { id: goals.id, message: '成功しました' }, status: :ok
      else
        render json: { message: '保存出来ませんでした', errors: threemonths_goals.errors.messages }, status: :bad_request
      end
    end
    render json: { id: threemonths_goals_params.id, message: '成功しました' }, status: :ok
  end

  def index
    threemonths_goals = ThreemonthsGoal.where("user_id = #{current_user.id}").order(id: 'ASC').last(4)
    threemonths_goals_array = threemonths_goals.map do |threemonths_goal|
      {
        id: threemonths_goal.id,
        user_id: threemonths_goal.user_id,
        name: threemonths_goal.user.name,
        aim: threemonths_goal.aim,
        quarter: threemonths_goal.quarter,
        email: threemonths_goal.user.email,
        created_at: threemonths_goal.created_at
      }
    end
    render json: threemonths_goals_array, status: 200
  end

  private

  def threemonths_goals_params
    params
      .require(:threemonths_goal)
      .permit(:aim_1, :aim_2, :aim_3, :aim_4)
  end
end
