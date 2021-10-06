class Square < ApplicationRecord
  belongs_to :user
  has_many :deck_recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :square_comments, dependent: :destroy
  attachment :image

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
