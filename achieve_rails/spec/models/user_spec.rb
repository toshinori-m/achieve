require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'userを保存できる' do
      it '正規のデータなら有効' do
        expect(@user).to be_valid
      end

      it 'nameが80なら有効' do
        @user.name = 'a' * 80
        expect(@user).to be_valid
      end

      it 'emailが80文字なら有効' do
        @user.email = 'a' * 80 + "@gamil.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字なら有効" do
        @user.password = @user.password_confirmation = "a" * 6
        expect(@user).to be_valid
      end
    end
    
    context 'userを保存できない' do
      it 'nameがnilなら無効' do
        @user.name = nil
        @user.valid?
        expect(@user).to_not be_valid
      end

      it 'nameが空白文字なら無効' do
        @user.name = " "
        @user.valid?
        expect(@user).to_not be_valid
      end

      it "nameが81文字なら無効" do
        @user.name = "a" * 81
        @user.valid?
        expect(@user).to_not be_valid
      end

      it "mailがnilなら無効" do
        @user.email = nil
        @user.valid?
        expect(@user).to_not be_valid
      end

      it "mailが空白文字なら無効" do
        @user.email = " "
        @user.valid?
        expect(@user).to_not be_valid
      end

      it "mailが81文字なら無効" do
        @user.email = "a" * 91 + "@gamil.com"
        @user.valid?
        expect(@user).to_not be_valid
      end

      it "すでに登録されているmailなら無効" do
        @user.email1 = FactoryBot.create(:user)
        @user.email2 = FactoryBot.create(:user)
        @user.valid?
        expect(@user.email2).to_not be_valid
      end

  #     it 'aimがnilなら無効' do
  #       new_preset = FactoryBot.build(:goal, aim: nil)
  #       expect(new_preset).to_not be_valid
  #     end

  #     it 'aimが空白文字なら無効' do
  #       new_preset = FactoryBot.build(:goal, aim: " ")
  #       expect(new_preset).to_not be_valid
  #     end

  #     it 'aimが141文字なら無効' do
  #       aim_length = 'a' * 141
  #       new_preset = FactoryBot.build(:goal, aim: aim_length)
  #       expect(new_preset).to_not be_valid
  #     end
    end
  end
end