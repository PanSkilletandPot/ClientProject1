class CategoriesController < ApplicationController
  def appetizers
    @appetizers = Recipe.select { |obj| obj.category == "Appetizer" }
  end

  def salads
    @salads = Recipe.select { |obj| obj.category == "Salad" }
  end

  def main_courses
    @main_courses = Recipe.select { |obj| obj.category == "Main" }
  end

  def desserts
    @desserts = Recipe.select { |obj| obj.category == "Dessert" }
  end
end
