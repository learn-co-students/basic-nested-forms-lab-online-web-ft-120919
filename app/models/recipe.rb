class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  # def name=(n)
  #   Ingredient.find_or_create_by(name: n)
  # end

  # def name
  #   self.ingredients.name
  # end
end
