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
      @errors = @user.errors.full_messages
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

  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :category, :ingredients, :prep_time, :instructions, :user_id)
    end
end
