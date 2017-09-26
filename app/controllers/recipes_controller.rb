class RecipesController < ApplicationController
  include UserHelper
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      @errors = ["error"]
      render 'new'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews
  end

  def update
    @recipe = Recipe.find(params[:id])
    if current_user.id == @recipe.user_id
      @recipe.assign_attributes(recipe_params)
        if @recipe.save
          redirect_to @recipe
        end
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def ingredients
    @ingredient = Ingredient.new
  end

  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :category, :ingredients, :prep_time, :instructions, :user_id)
    end
end
