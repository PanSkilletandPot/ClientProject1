class RecipesController < ApplicationController
  include UserHelper
  def index
    @recipes = Recipe.all
  end

  def reviews
    require_user
    @recipes = Recipe.all
    @review = Review.new(review_params)
    @review.save
    render 'index'
  end

  def create
    require_user
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to action: "ingredient", id: @recipe.id
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
    @user_id = session[:user_id]
    @reviews = @recipe.reviews
  end

  def update
    if current_user == @recipe.user_id
      @recipe = Recipe.find(params[:id])
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
    redirect_to 'index'
  end

  def ingredient
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @ingredient = Ingredient.new
  end

  def create_ingredients
    @ingredient = Ingredient.new(ingredient_params)
    p @ingredient
    @ingredient.save
    redirect_to action: "ingredient", id: params[:id]
  end


  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :category, :ingredients, :prep_time, :instructions, :user_id)
    end

    def review_params
      params.require(:review).permit(:rating, :body, :user_id, :recipe_id)
    end  
  
    def ingredient_params
      params.require(:ingredient).permit(:ingredient, :recipe_id)
    end
end
