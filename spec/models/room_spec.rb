require 'rails_helper'

RSpec.describe 'Roomモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Room.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Lawyerモデルとの関係' do
      it '1:Nとなっている' do
        expect(Room.reflect_on_association(:lawyer).macro).to eq :belongs_to
      end
    end
  end
end