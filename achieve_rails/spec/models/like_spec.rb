require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '良いね機能' do
    before do
      @like = FactoryBot.create(:like)
    end

    context '良いねすることが出来る' do
      it '正規のデータなら有効' do
        expect(@like).to be_valid
      end

      it 'message_idが同じでuser_idが異なる' do
        new_preset = FactoryBot.build(:like, message_id: @like.message_id)
        expect(new_preset).to be_valid
      end

      it 'user_idが同じでmessage_idが異なる' do
        new_preset = FactoryBot.build(:like, user_id: @like.message_id)
        expect(new_preset).to be_valid
      end
    end

    context '良いねすることが出来る' do
      it 'user_idがnilなら無効' do
        new_preset = FactoryBot.build(:like, user_id: nil)
        expect(new_preset).to_not be_valid
      end

      it 'message_idがnilなら無効' do
        new_preset = FactoryBot.build(:like, message_id: nil)
        expect(new_preset).to_not be_valid
      end
    end

    context '一意性の検証' do
      it 'user_idとmessage_idの組み合わせは一意であること' do
        new_preset = FactoryBot.build(:like, user_id: @like.user_id, message_id: @like.message_id)
        expect(new_preset).to be_valid
      end
    end
  end
end