require 'rails_helper'

RSpec.describe 'Lawyerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:lawyer) { build(:lawyer) }
    subject { test_lawyer.valid? }
    context 'nameカラム' do
      let(:test_lawyer) { lawyer }
      it '空欄でないこと' do
        test_lawyer.name = ''
        is_expected.to eq false;
      end
    end
    context 'name_kanaカラム' do
      let(:test_lawyer) { lawyer }
      it '空欄でないこと' do
        test_lawyer.name_kana = ''
        is_expected.to eq false
      end
    end
    context 'officeカラム' do
      let(:test_lawyer) { lawyer }
      it '空欄でないこと' do
        test_lawyer.office = ''
        is_expected.to eq false
      end
    end
    context 'professionカラム' do
      let(:test_lawyer) { lawyer }
      it '選択してあること' do
        test_lawyer.profession = ''
        is_expected.to eq false
      end
    end
    context 'sexカラム' do
      let(:test_lawyer) { lawyer }
      it '選択してあること' do
        test_lawyer.sex = ''
        is_expected.to eq false
      end
    end
    context 'ageカラム' do
      let(:test_lawyer) { lawyer }
      it '選択してあること' do
        test_lawyer.age = ''
        is_expected.to eq false
      end
    end
    context 'postal_codeカラム' do
      let(:test_lawyer) { lawyer }
      it '空欄でないこと' do
        test_lawyer.postal_code = ''
        is_expected.to eq false
      end
      it '7桁であること' do
        test_lawyer.postal_code = '5316107'
        is_expected.to eq true
      end
    end
    context 'prefectureカラム' do
      let(:test_lawyer) { lawyer }
      it '選択してあること' do
        test_lawyer.prefecture = ''
        is_expected.to eq false
      end
    end
    context 'addressカラム' do
      let(:test_lawyer) { lawyer }
      it '空欄でないこと' do
        test_lawyer.address = ''
        is_expected.to eq false
      end
    end
    context 'phone_numberカラム' do
      let(:test_lawyer) { lawyer }
      it '数字が10桁であること' do
        test_lawyer.phone_number = '0611112222'
        is_expected.to eq true
      end
      it '又は11桁であること' do
        test_lawyer.phone_number = '09012345678'
        is_expected.to eq true
      end
      it 'それ以外では通らないこと' do
        test_lawyer.phone_number = '080'
        is_expected.to eq false
      end
      it '推奨なので空欄も可能' do
        test_lawyer.phone_number = ''
        is_expected.to eq true
      end
    end
    context 'urlカラム' do
      let(:test_lawyer) { lawyer }
      it '始まりがhttpであること' do
        test_lawyer.url = 'http://'
        is_expected.to eq true
      end
      it '又はhttpsであること' do
        test_lawyer.url = 'https://'
        is_expected.to eq true
      end
      it 'それ以外は通らないこと' do
        test_lawyer.url = 'abcde'
        is_expected.to eq false
      end
      it '推奨なので空欄も可能' do
        test_lawyer.url = ''
        is_expected.to eq true
      end
    end
    context 'profileカラム' do
      let(:test_lawyer) { lawyer }
      it '50文字以下であること' do
        test_lawyer.profile = Faker::Lorem.characters(number:51)
        is_expected.to eq false
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
=begin  当初Fakerを使わずに作ったテスト
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
=end
end