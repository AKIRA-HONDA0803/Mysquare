class Square < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :deck_squares, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :square_comments, dependent: :destroy
  attachment :image

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, presence: true

  def self.search(keyword)
    where(["title like? or description like?","%#{keyword}%", "%#{keyword}%"])
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
