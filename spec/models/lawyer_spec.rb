require 'rails_helper'

RSpec.describe 'Lawyerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context "新規登録ができない" do
        before do
            @lawyer = Lawyer.new
            @lawyer.name = ""
            @lawyer.name_kana = ""
            @lawyer.office = ""
            @lawyer.profession = ""
            @lawyer.sex = ""
            @lawyer.age = ""
            @lawyer.postal_code = ""
            @lawyer.prefecture = ""
            @lawyer.address = ""
            @lawyer.phone_number = "080"
            @lawyer.url = "a"
        end
        it "全て正しく入力されていないので、保存されない" do
            expect(@lawyer).to be_invalid
            expect(@lawyer.errors[:name]).to include("can't be blank")
            expect(@lawyer.errors[:name_kana]).to include("can't be blank")
            expect(@lawyer.errors[:office]).to include("can't be blank")
            expect(@lawyer.errors[:profession]).to include("can't be blank")
            expect(@lawyer.errors[:sex]).to include("is not included in the list")
            expect(@lawyer.errors[:age]).to include("can't be blank")
            expect(@lawyer.errors[:postal_code]).to include("can't be blank")
            expect(@lawyer.errors[:postal_code]).to include("is the wrong length (should be 7 characters)")
            expect(@lawyer.errors[:prefecture]).to include("can't be blank")
            expect(@lawyer.errors[:address]).to include("can't be blank")
            expect(@lawyer.errors[:phone_number]).to include("is too short (minimum is 10 characters)")
            expect(@lawyer.errors[:url]).to include("is invalid")
        end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Lawyer.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end