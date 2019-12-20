class RecipesController < ApplicationController
  include RecipesHelper
  def index
    session[:user_id] = 1
    @recipes = Recipe.all
    @salads = @recipes.get_highest_5_recipes("Salad")
    @mains = @recipes.get_highest_5_recipes("Entree")
    @desserts = @recipes.get_highest_5_recipes("Dessert")
    @appetizers = @recipes.get_highest_5_recipes("Appetizer")
  end

  def create
    require_user
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to action: "ingredient", id: @recipe.id
    else
      @errors = @recipe.errors.full_messages
      render 'new'
    end
  end

  def new
    require_user
    @recipe = Recipe.new
  end

  def edit
    require_user
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients
      @ingredient = Ingredient.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_id = session[:user_id]
    @reviews = @recipe.reviews
  end

  def update
    require_user
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)
    if @recipe.save
          redirect_to :action => 'ingredient'
    else
      @errors = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    require_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def category
    @type = params[:category]
    @recipes = Recipe.select { |recipe| recipe.category == @type }
  end

  def ingredient
    require_user
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @ingredient = Ingredient.new
  end

  def create_ingredients
    require_user
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = Recipe.find(params[:ingredient][:recipe_id])
    @ingredients = @recipe.ingredients
    if @ingredient.save
      respond_to do |format|
        format.html { redirect_to action: "ingredient", id: params[:id] }
        format.js { render partial: "create_ingredients" }
      end
    else
      errors = @ingredient.errors.full_messages
      respond_to do |format|
        format.html {
          render 'ingredient'
        }
        format.js { render partial: "create_error" }
      end
    end
  end

  def destroy_ingredients
    require_user
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js {render partial: "destroy_ingredients"}
    end
  end


  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :category, :ingredients, :prep_time, :instructions, :user_id, :avatar)
    end

    def ingredient_params
      params.require(:ingredient).permit(:ingredient, :recipe_id)
    end
end
