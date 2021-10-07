class DeckRecipe < ApplicationRecord
  MAX_DECK_RECIPE_COUNT = 9
  belongs_to :user
  belongs_to :square, optional: true

  validate :deck_recipe_count_must_be_within_limit

  private

    def deck_recipe_count_must_be_within_limit
      errors.add(:base, "deck_recipe count limit: #{MAX_DECK_RECIPE_COUNT}") if user.deck_recipes.count >= MAX_DECK_RECIPE_COUNT
    end
end
