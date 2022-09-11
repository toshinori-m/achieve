require 'rails_helper'

RSpec.describe ThreemonthsGoal, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ThreemonthsGoalを保存できる' do
      it '正規のデータなら有効' do
        new_preset = FactoryBot.build(:threemonths_goal, user_id: @user.id)
        expect(new_preset).to be_valid
      end

      it 'aimが140文字なら有効' do
        aim_length = 'a' * 140
        new_preset = FactoryBot.build(:threemonths_goal, aim: aim_length)
        expect(new_preset).to be_valid
      end
    end

    context 'ThreemonthsGoalを保存できない' do
      it 'user_idがnilなら無効' do
        new_preset = FactoryBot.build(:threemonths_goal, user_id: nil)
        expect(new_preset).to_not be_valid
      end

      it 'aimがnilなら無効' do
        new_preset = FactoryBot.build(:threemonths_goal, aim: nil)
        expect(new_preset).to_not be_valid
      end

      it 'aimが空白文字なら無効' do
        new_preset = FactoryBot.build(:threemonths_goal, aim: ' ')
        expect(new_preset).to_not be_valid
      end

      it 'aimが141文字なら無効' do
        aim_length = 'a' * 141
        new_preset = FactoryBot.build(:threemonths_goal, aim: aim_length)
        expect(new_preset).to_not be_valid
      end
    end
  end
end
