class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  def rating_sum
    self.reviews.sum(:rating)
  end

  def number_of_reviews
    self.reviews.length
  end

  def average_rating
    rating_sum / number_of_reviews
  end
end
