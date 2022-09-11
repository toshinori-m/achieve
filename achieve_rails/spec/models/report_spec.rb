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
        new_preset = FactoryBot.build(:report, location: location_length, time: time_length, condition: condition_length, intensity: intensity_length, point: point_length, report: report_length)
        expect(new_preset).to be_valid
      end
    end

    context 'Reportを保存できない' do
      it 'user_idがnilなら無効' do
        new_preset = FactoryBot.build(:report, user_id: nil)
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensity,point,reportがnilなら無効' do
        new_preset = FactoryBot.build(:report, location: nil, time: nil, condition: nil, intensity: nil, point: nil, report: nil)
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensity,point,reportが空白文字なら無効' do
        new_preset = FactoryBot.build(:report, location: ' ', time: ' ', condition: ' ', intensity: ' ', point: ' ', report: ' ')
        expect(new_preset).to_not be_valid
      end

      it 'location,time,condition,intensityが141文字、point,reportが251文字なら無効' do
        location_length = 'a' * 141
        time_length = 'b' * 141
        condition_length = 'c' * 141
        intensity_length = 'd' * 141
        point_length = 'e' * 251
        report_length = 'f' * 251
        new_preset = FactoryBot.build(:report, location: location_length, time: time_length, condition: condition_length, intensity: intensity_length, point: point_length, report: report_length)
        expect(new_preset).to_not be_valid
      end
    end
  end
end
