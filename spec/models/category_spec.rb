require 'rails_helper'

RSpec.describe 'Categoryモデル', type: :model do
  describe 'アソシエーションのチェック' do
    context 'Squareモデル' do
      it '1:Nの関係か' do
        expect(Category.reflect_on_association(:squares).macro).to eq :has_many
      end
    end
  end
end