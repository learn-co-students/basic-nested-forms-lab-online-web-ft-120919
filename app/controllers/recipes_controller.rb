class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
    2.times { @recipes.ingredients.build }
    @ingredients = @recipes.ingredients
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.tap{ |m| 2.times{m.ingredients.build} }.ingredients
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
