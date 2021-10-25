require 'rails_helper'

RSpec.describe 'Userモデル', type: :model do
  describe 'バリデーションテスト' do
    subject { user.valid? }
    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

  context 'name' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '名前の重複可能' do
        user.name = other_user.name
        is_expected.to eq true
      end
    end

  context 'introduction' do
      it '自己紹介は200文字以内であるか' do
        user.introduction = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '自己紹介は200文字以内であるか　201文字は×' do
        user.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

  context 'email' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
    end
  end

  describe 'Userの作成' do
	    it "有効な内容の場合は保存されるか" do
	      expect(FactoryBot.build(:user)).to be_valid
	    end
	  end

	describe 'アソシエーションのチェック' do
    context 'squareモデル' do
      it '1:Nの関係か' do
        expect(User.reflect_on_association(:squares).macro).to eq :has_many
      end
    end

    context 'favoriteモデル' do
      it '1:Nの関係か' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'relationshipモデル' do
      it '1:Nの関係か' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end
  end
end
