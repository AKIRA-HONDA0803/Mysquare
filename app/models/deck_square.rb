class DeckSquare < ApplicationRecord
  acts_as_list scope: :user
  MAX_DECK_SQUARE_COUNT = 9
  belongs_to :user, optional: true
  belongs_to :square, optional: true

  validate :deck_square_count_must_be_within_limit

  private

  def deck_square_count_must_be_within_limit
    errors.add(:base, "deck_square count limit: #{MAX_DECK_SQUARE_COUNT}") if user.deck_squares.count >= MAX_DECK_SQUARE_COUNT
  end
end
