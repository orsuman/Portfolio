require 'rails_helper'

RSpec.describe 'Troubleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:trouble) { build(:trouble, user_id: user.id) }
    context 'titleカラム' do
      it '空欄でないこと' do
        trouble.title = ''
        expect(trouble.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        trouble.body = ''
        expect(trouble.valid?).to eq false;
      end
      it '2000文字以下であること' do
        trouble.body = Faker::Lorem.characters(number:2001)
        expect(trouble.valid?).to eq false;
      end
    end
    context 'categoryカラム' do
      it '空欄でないこと' do
        trouble.category_id = ''
        expect(trouble.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Trouble.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end