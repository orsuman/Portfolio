require 'rails_helper'

 describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:trouble) { create(:trouble, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end
    describe '相談の投稿のテスト' do
    context '表示の確認' do
      it '相談を投稿するが表示される' do
        expect(page).to have_content '相談を投稿する'
      end
    end
  end
end