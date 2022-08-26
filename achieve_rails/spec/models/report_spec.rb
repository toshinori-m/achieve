require 'rails_helper'

RSpec.describe Report, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'Reportを保存できる' do
      it '正規のデータなら有効' do
        new_preset = FactoryBot.build(:report, user_id: @user.id)
        expect(new_preset).to be_valid
      end

      it 'location,time,condition,intensityが140文字、point,reportが250文字なら有効' do
        location_length = 'a' * 140
        time_length = 'b' * 140
        condition_length = 'c' * 140
        intensity_length = 'd' * 140
        point_length = 'e' * 250
        report_length = 'f' * 250
        new_preset = FactoryBot.build(:report, location: location_length)
        new_preset = FactoryBot.build(:report, time: time_length)
        new_preset = FactoryBot.build(:report, condition: condition_length)
        new_preset = FactoryBot.build(:report, intensity: intensity_length)
        new_preset = FactoryBot.build(:report, point: point_length)
        new_preset = FactoryBot.build(:report, report: report_length)
        expect(new_preset).to be_valid
      end
    end

    context 'Reportを保存できない' do
      it 'user_idがnilなら無効' do
        new_preset = FactoryBot.build(:report, user_id: nil)
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensity,point,reportがnilなら無効' do
        new_preset = FactoryBot.build(:report, location: nil)
        new_preset = FactoryBot.build(:report, time: nil)
        new_preset = FactoryBot.build(:report, condition: nil)
        new_preset = FactoryBot.build(:report, intensity: nil)
        new_preset = FactoryBot.build(:report, point: nil)
        new_preset = FactoryBot.build(:report, report: nil)
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensity,point,reportが空白文字なら無効' do
        new_preset = FactoryBot.build(:report, location: " ")
        new_preset = FactoryBot.build(:report, time: " ")
        new_preset = FactoryBot.build(:report, condition: " ")
        new_preset = FactoryBot.build(:report, intensity: " ")
        new_preset = FactoryBot.build(:report, point: " ")
        new_preset = FactoryBot.build(:report, report: " ")
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensityが141文字、point,reportが251文字なら無効' do
        location_length = 'a' * 141
        time_length = 'b' * 141
        condition_length = 'c' * 141
        intensity_length = 'd' * 141
        point_length = 'e' * 251
        report_length = 'f' * 251
        new_preset = FactoryBot.build(:report, location: location_length)
        new_preset = FactoryBot.build(:report, time: time_length)
        new_preset = FactoryBot.build(:report, condition: condition_length)
        new_preset = FactoryBot.build(:report, intensity: intensity_length)
        new_preset = FactoryBot.build(:report, point: point_length)
        new_preset = FactoryBot.build(:report, report: report_length)
        expect(new_preset).to_not be_valid
      end
    end
  end
end