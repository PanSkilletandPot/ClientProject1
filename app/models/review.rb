class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :body, :recipe, presence: true
end
