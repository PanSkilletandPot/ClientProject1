class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'placeholder.png'
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :recipe_name, uniqueness: true
  validates :recipe_name, :category, :prep_time, :instructions, :user, presence: true

   include Rails.application.routes.url_helpers

  def rating_sum
    self.reviews.sum(:rating)
  end

  def number_of_reviews
    self.reviews.length
  end

  def average_rating
    if rating_sum == 0 || number_of_reviews == 0
      return 0
    else
      ave = rating_sum.to_f / number_of_reviews.to_f
      ave.round(2)
    end
  end

  def calculate_prep_time
    if self.prep_time.to_i < 60
      return self.prep_time.to_s + " minutes"
    else
      hours = (self.prep_time.to_i / 60)
      mins = (self.prep_time.to_i - hours * 60)
      hours > 1 ? hour_str = " hours" : hour_str = " hour";
      mins > 1 ? min_str = " minutes" : min_str = " minute";
      return hours.to_s + hour_str + ", " + mins.to_s + min_str
    end
  end

  def self.get_highest_5_recipes(category)
    recipes = Recipe.all
    category = recipes.select {|recipe| recipe.category == category}
    sorted_category = category.sort { |x,y| y.average_rating<=> x.average_rating } 
    sorted_category.first(5)
  end  
end
