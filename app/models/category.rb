class Category < ApplicationRecord
  has_many :squares, dependent: :destroy
end
