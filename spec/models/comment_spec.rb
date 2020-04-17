require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context "データが正しく保存されない" do
        before do
            @comment = Comment.new
            @comment.comment = ""
            @comment.save
        end
        it "回答が入力されていない" do
            expect(@comment).to be_invalid
            expect(@comment.errors[:comment]).to include("can't be blank")
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