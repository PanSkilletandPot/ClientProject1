class CategorysController < ApplicationController
  def Appetizers
    @appetizers = Recipe.select {|obj| obj.category == "appetizer"}
  end

  def salads
    @salads = Recipe.select {|obj| obj.category == "salad"}
  end

  def main_courses
    @main_courses = Recipe.select {|obj| obj.category == "course"}
  end

  def desserts
    @desserts = Recipe.select {|obj| obj.category == "dessert"}
  end
end