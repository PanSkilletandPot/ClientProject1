class CategoriesController < ApplicationController
  def appetizers
    @recipes = Recipe.all
  end

  def salads
    @recipes = Recipe.all
  end

  def main_courses
    @recipes = Recipe.all
  end

  def desserts
    @recipes = Recipe.all
  end
end
