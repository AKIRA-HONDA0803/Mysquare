class DeckRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :square
end
