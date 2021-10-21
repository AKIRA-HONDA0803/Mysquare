class DeckRecipe < ApplicationRecord
  has_many :deck_squares, dependent: :destroy
  belongs_to :user

  validates :theme, presence: true
end
