require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:lawyer) { create(:lawyer) }
    let!(:comment) { build(:comment, lawyer_id: lawyer.id) }
    context 'commentカラム' do
      it '空欄でないこと' do
        comment.comment = ''
        expect(comment.valid?).to eq false;
      end
      it '2000文字以下であること' do
        comment.comment = Faker::Lorem.characters(number:2001)
        expect(comment.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Lawyerモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:lawyer).macro).to eq :belongs_to
      end
    end
  end
end