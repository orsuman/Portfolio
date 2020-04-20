require 'rails_helper'

RSpec.describe 'Inquiryモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:inquiry) { build(:inquiry) }
    context 'subjectカラム' do
       it '選択してあること' do
        inquiry.subject = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'emailカラム' do
       it '空欄でないこと' do
        inquiry.email = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'send_emailカラム' do
       it '空欄であっても良い' do
        inquiry.send_email = ''
        expect(inquiry.valid?).to eq true;
      end
    end
    context 'nameカラム' do
      it '空欄でないこと' do
        inquiry.name = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'name_kanaカラム' do
      it '空欄でないこと' do
        inquiry.name_kana = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'sexカラム' do
       it '選択してあること' do
        inquiry.sex = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'sexカラム' do
       it '選択してあること' do
        inquiry.is_user = ''
        expect(inquiry.valid?).to eq false;
      end
    end
    context 'contentカラム' do
      it '空欄でないこと' do
        inquiry.content = ''
        expect(inquiry.valid?).to eq false;
      end
    end
  end
end
