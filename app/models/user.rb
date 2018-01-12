class User < ApplicationRecord
  has_many :reviews
  has_many :recipes

  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true

  has_secure_password

  def rating_sum
    self.reviews.sum(:rating)
  end

  def number_of_reviews
    self.reviews.length
  end

  def average_rating
    if rating_sum == 0 || number_of_reviews == 0
      return false
    else
      ave = rating_sum.to_f / number_of_reviews.to_f
      ave.round(2)
    end
  end

  def best_recipe 
    recipes = self.recipes
    sorted_recipe_list = recipes.sort { |x,y| y.average_rating <=> x.average_rating } 
    return sorted_recipe_list[0]
  end  

  def number_of_recipes_entered
     self.recipes.length
  end

  def number_of_recipes_rated
    self.reviews.length
  end  

  def highest_rated_review
    reviews = self.reviews
    sorted_reviews_list = reviews.sort { |x,y| y.rating <=> x.rating } 
    return sorted_reviews_list[0]
  end  

  def user_activity_percentile
    users = User.all
    sorted_users = users.sort do |x,y| 
      y.number_of_recipes_entered + y.number_of_recipes_rated <=> x.number_of_recipes_entered + x.number_of_recipes_rated 
    end
    user_array_position = sorted_users.find_index(self) + 1
    total_number_of_users = User.all.length
    percentile = (100 - (user_array_position.to_f / total_number_of_users * 100)).round()
    if percentile >= 50
      return "Top " + (100 - percentile).to_s + " %"
    else
      return "Lower " + percentile.to_s + " %"
    end    
  end  
end