class Square < ApplicationRecord
  belongs_to :user
  attachment :image
end
