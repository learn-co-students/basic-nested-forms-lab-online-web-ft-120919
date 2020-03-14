class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
  end

  def create
    @recipe = Recipe.create(person_params)
    redirect_to recipe_path(@recipe)
  end

  def person_params
    params.require(:recipe).permit(
        :title,
        ingredients_attributes: [
            :name,
            :quantity
        ]
    )
  end
end
