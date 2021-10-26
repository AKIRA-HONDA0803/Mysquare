require 'rails_helper'
describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'ヘッダーのテスト' do
    context '表示内容のテスト' do
      it 'ロゴのリンクはあるか' do
        logo_link = find_all('a')[0].native.inner_text
        expect(logo_link).to match("")
      end
      it 'マイページのリンクはあるか' do
        mypage_link = find_all('a')[1]
        expect(mypage_link[:href]).to eq user_path(user)
      end
      it 'Square一覧ページのリンクはあるか' do
        square_link = find_all('a')[2]
        expect(square_link[:href]).to eq squares_path
      end
      it 'Square作成ページのリンクはあるか' do
        square_new_link = find_all('a')[3]
        expect(square_new_link[:href]).to eq new_square_path
      end
      it 'My quare一覧ページのリンクはあるか' do
        mysquare_link = find_all('a')[4]
        expect(mysquare_link[:href]).to eq deck_recipes_path
      end
      it 'My quare編集ページのリンクはあるか' do
        mysquare_edit_link = find_all('a')[5]
        expect(mysquare_edit_link[:href]).to eq deck_squares_path
      end
      it 'ログアウトのリンクはあるか' do
        logout_link = find_all('a')[6]
        expect(logout_link[:href]).to eq destroy_user_session_path
      end
    end
  end
  describe 'マイページのテスト' do
    before do
      visit user_path(user)
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it '名前と自己紹介文が表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
      end
      it 'プロフィール編集のリンクが表示される' do
        expect(page).to have_link 'プロフィール編集', href: edit_user_path(user)
      end
      it 'ユーザーのSquare一覧のリンクが表示される' do
        expect(page).to have_link 'Square', href: square_lists_path(user.id)
      end
      it 'ユーザーのフォロー一覧が表示される' do
        expect(page).to have_link 'フォロー中'
      end
      it 'ユーザーのフォロワー一覧が表示される' do
        expect(page).to have_link 'フォロー中'
      end
      it 'ユーザーのお気に入り一覧が表示される' do
        expect(page).to have_link 'お気に入り'
      end
    end
  end
  describe 'Square一覧のテスト' do
    before do
      visit squares_path
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/squares'
      end
      it 'タイトル・説明・画像が表示される/詳細ページのリンクがある' do
        (1..5).each do |i|
	      Square.create(title:'hoge'+i.to_s,description:'hogehoge'+i.to_s)
	      end
	      visit squares_path
	      Square.all.each_with_index do |square,i|
        expect(page).to have_content square.title
        expect(page).to have_content square.description
        expect(page).to have_content square.image
        show_link = find_all('a')[j]
	      expect(show_link.native.inner_text).to match("")
	      expect(show_link[:href]).to eq squares_path(square)
        end
      end
      it 'カテゴリー一覧が表示される' do
        (1..8).each do |i|
        Category.create(name:'hoge'+i.to_s)
        end
        visit squares_path
        Category.all.each_with_index do |category,i|
        expect(page).to have_content category.name
        end
      end
    end
  end

  describe 'Square作成画面のテスト' do
    before do
      visit new_square_path
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/squares/new'
      end
      it '「Square 作成」と表示される' do
        expect(page).to have_content 'Square 作成'
      end
      it '画像投稿フォームがあるか' do
        expect(page).to have_field '画像'
      end
      it 'タイトルフォームがあるか' do
        expect(page).to have_field 'タイトル'
      end
      it 'タイトルフォームは空になっているか' do
        expect(find_field('タイトル').text).to be_blank
      end
      it '説明フォームがあるか' do
        expect(page).to have_field '説明'
      end
      it 'カテゴリーフォームがあるか' do
        # 「選択して下さい」が最初に出てくる
        select(value = "", from: "square_category_id")
      end
      it 'カテゴリーに1.お金が存在する' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '1' }
      end
      it 'カテゴリーに2.仕事が存在する' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '2' }
      end
      it 'カテゴリーに3.知識・経験' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '3' }
      end
      it 'カテゴリーに4.家族' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '4' }
      end
      it 'カテゴリーに5.お金が存在する' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '5' }
      end
      it 'カテゴリーに6.身体が存在する' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '6' }
      end
      it 'カテゴリーに7.心・在り方' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '7' }
      end
      it 'カテゴリーに8.その他' do
        find("#square_category_id").all(:css, 'option').find { |o| o.value == '8' }
      end
      it 'ラジオボタンで選択する(公開)' do
        choose "square_is_released_true"
        expect(page).to have_checked_field '公開'
      end
      it 'ラジオボタンで選択する(非公開)' do
        choose "square_is_released_false"
        expect(page).to have_checked_field '非公開'
      end
      it '作成ボタンが表示される' do
        expect(page).to have_button '作成する'
      end

    end
  end
  describe 'Square詳細画面のテスト' do
    let(:square) { create(:square) }
    let(:other_square) { create(:square) }
    before do
      visit squares_path(square)
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/squares' + '/square.id.to_s'
      end
      it 'Squareのタイトルと説明が画面に表示されていること' do
        expect(page).to have_content square.title
        expect(page).to have_content square.description
      end
    end
  end
end

