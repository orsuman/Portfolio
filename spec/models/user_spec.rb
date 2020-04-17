require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context "新規登録ができない" do
        before do
            @user = User.new
            @user.name = ""
            @user.name_kana = ""
            @user.nickname = ""
            @user.sex = ""
            @user.age = ""
            @user.prefecture = ""
            @user.city = ""
        end
        it "全て正しく入力されていないので、保存されない" do
            expect(@user).to be_invalid
            expect(@user.errors[:name]).to include("can't be blank")
            expect(@user.errors[:name_kana]).to include("can't be blank")
            expect(@user.errors[:nickname]).to include("can't be blank")
            expect(@user.errors[:sex]).to include("is not included in the list")
            expect(@user.errors[:age]).to include("can't be blank")
            expect(@user.errors[:prefecture]).to include("can't be blank")
            expect(@user.errors[:city]).to include("can't be blank")
        end
    end
  end
end