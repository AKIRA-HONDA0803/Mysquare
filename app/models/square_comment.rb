class SquareComment < ApplicationRecord
  belongs_to :user
  belongs_to :square
end
