require 'rails_helper'
describe 'トップページ' do
  describe 'Topページのテスト' do
    before do
      visit root_path
    end
    context '表示内容の確認' do
      it 'urlは正しいか' do
        expect(current_path).to eq '/'
      end
      it '新規登録のリンクが表示されているか' do
        sign_up_link = find_all('a')[0]
        expect(sign_up_link.native.inner_text).to match(/新規登録/i)
      end
      it '新規登録リンクの内容が正しい' do
        sign_up_link = find_all('a')[0].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
      it 'ログインのリンクが表示されているか' do
        login_link = find_all('a')[1]
        expect(login_link.native.inner_text).to match(/ログイン/i)
      end
      it 'ログインのリンクの内容が正しい' do
        login_link = find_all('a')[1].native.inner_text
        expect(page).to have_link login_link, href: new_user_session_path
      end
    end
  end
  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it '名前フォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'Eメールフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'パスワード（確認用）フォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end
  end

  describe 'ユーザログインのテスト' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'Eメールフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
    end
  end
end