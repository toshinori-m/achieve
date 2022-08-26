require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'Messageを保存できる' do
      it '正規のデータなら有効' do
        new_preset = FactoryBot.build(:message, user_id: @user.id)
        expect(new_preset).to be_valid
      end

      it 'contentが140文字なら有効' do
        content_length = 'a' * 140
        new_preset = FactoryBot.build(:message, content: content_length)
        expect(new_preset).to be_valid
      end
    end

    context 'Messageを保存できない' do
      it 'user_idがnilなら無効' do
        new_preset = FactoryBot.build(:message, user_id: nil)
        expect(new_preset).to_not be_valid
      end

      it 'contentがnilなら無効' do
        new_preset = FactoryBot.build(:message, content: nil)
        expect(new_preset).to_not be_valid
      end

      it 'contentが空白文字なら無効' do
        new_preset = FactoryBot.build(:message, content: " ")
        expect(new_preset).to_not be_valid
      end

      it 'contentが141文字なら無効' do
        content_length = 'a' * 141
        new_preset = FactoryBot.build(:message, content: content_length)
        expect(new_preset).to_not be_valid
      end
    end
  end
end
