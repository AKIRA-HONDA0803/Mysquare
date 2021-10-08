class DeckRecipe < ApplicationRecord
  has_many :deck_squares, dependent: :destroy
end
