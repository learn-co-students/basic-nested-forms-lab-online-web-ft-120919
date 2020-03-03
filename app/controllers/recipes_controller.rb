class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients << Ingredient.new
    @recipe.ingredients << Ingredient.new
  end

  def create
    #raise params.inspect
    @recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
    #binding.pry
    #@recipe.ingredients_attributes=(params[:recipe][:ingredients_attributes])
    #@recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :ingredients_attributes => [:name, :quantity]
    )
  end
end
