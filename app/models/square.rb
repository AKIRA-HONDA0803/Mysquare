class Square < ApplicationRecord
  belongs_to :user
   has_many :deck_recipes, dependent: :destroy
  attachment :image

end
