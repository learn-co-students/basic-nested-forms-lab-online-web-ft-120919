class Recipe < ActiveRecord::Base
  has_many :ingredients 

  #This generates ingredients_attributes= method 
  accepts_nested_attributes_for :ingredients 
end
