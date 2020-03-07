class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    20.times {@recipe.ingredients.build}
  end

  def create
    @recipe= Recipe.new(recipe_params)
    @recipe.ingredients.each do |ingredient|
      if ingredient.name.empty? or ingredient.quantity.empty?
        ingredient.delete
      else
        ingredient.save
      end      
    end
    # byebug
    !!@recipe.save ? (redirect_to @recipe) : (render 'new')
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])   
  end
end
