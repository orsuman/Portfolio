require 'rails_helper'

RSpec.describe 'Categoryモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:category) { build(:category) }
    context 'nameカラム' do
      it '空欄でないこと' do
        category.name = ''
        expect(category.valid?).to eq false;
      end
    end
    context 'is_activeカラム' do
      it '選択してあること' do
        category.is_active = ''
        expect(category.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Troubleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:troubles).macro).to eq :has_many
      end
    end
  end
end