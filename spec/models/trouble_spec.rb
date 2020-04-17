require 'rails_helper'

RSpec.describe 'Troubleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context "相談投稿が正しく保存されない" do
        before do
            @trouble = Trouble.new
            @trouble.title = ""
            @trouble.body = ""
            @trouble.category_id = ""
            @trouble.save
        end
        it "title, bodyが入力されていない、またcategoryが選択されていないので保存されない" do
            expect(@trouble).to be_invalid
            expect(@trouble.errors[:title]).to include("can't be blank")
            expect(@trouble.errors[:body]).to include("can't be blank")
            expect(@trouble.errors[:category_id]).to include("can't be blank")
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