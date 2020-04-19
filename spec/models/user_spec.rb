require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
    context 'name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name_kana = ''
        is_expected.to eq false
      end
    end
    context 'nicknameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.nickname = ''
        is_expected.to eq false
      end
    end
    context 'sexカラム' do
      let(:test_user) { user }
      it '選択してあること' do
        test_user.sex = ''
        is_expected.to eq false
      end
    end
    context 'ageカラム' do
      let(:test_user) { user }
      it '選択してあること' do
        test_user.age = ''
        is_expected.to eq false
      end
    end
    context 'prefectureカラム' do
      let(:test_user) { user }
      it '選択してあること' do
        test_user.prefecture = ''
        is_expected.to eq false
      end
    end
    context 'cityカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.city = ''
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Troubleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:troubles).macro).to eq :has_many
      end
    end
  end
=begin  当初Fakerを使わずに作ったテスト
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
=end
end