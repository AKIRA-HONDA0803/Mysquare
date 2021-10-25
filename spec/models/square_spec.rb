require 'rails_helper'

RSpec.describe 'Squareモデル', type: :model do
  describe 'バリデーションテスト' do
    subject { square.valid? }
    let!(:other_square) { create(:square) }
    let(:square) { build(:square) }

  context 'title' do
      it '空欄でないこと' do
        square.title = ''
        is_expected.to eq false
      end
      it 'タイトルの重複可能' do
        square.title = other_square.title
        is_expected.to eq true
      end
    end
  end
  describe 'アソシエーションのチェック' do
    context 'deck_squareモデル' do
      it '1:Nの関係か' do
        expect(Square.reflect_on_association(:deck_squares).macro).to eq :has_many
      end
    end
   context 'favoriteモデル' do
      it '1:Nの関係か' do
        expect(Square.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  context 'square_commentモデル' do
      it '1:Nの関係か' do
        expect(Square.reflect_on_association(:square_comments).macro).to eq :has_many
      end
    end

end
end